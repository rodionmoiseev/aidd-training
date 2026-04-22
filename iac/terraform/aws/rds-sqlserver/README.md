# RDS SQL Server (Terraform)

AI駆動開発研修で使用する RDS SQL Server 環境を AWS 上にデプロイする Terraform コードです。

## 構成図

```
Internet
  |
  IGW
  |
  +--- Public Subnet 1 (AZ-a) --- Bastion EC2
  +--- Public Subnet 2 (AZ-c)
  |
  +--- Private Subnet 1 (AZ-a) --+
  +--- Private Subnet 2 (AZ-c) --+-- RDS SQL Server Express
```

## 作成されるリソース

| リソース | 説明 |
|---------|------|
| VPC | パブリック x2 / プライベート x2 サブネット |
| EC2 (Bastion) | SSH ポートフォワード用の踏み台サーバー |
| RDS SQL Server Express | プライベートサブネットに配置 |
| S3 Bucket | SQL Server バックアップ復元用 (7日で自動削除) |
| Secrets Manager | RDS マスターパスワードの保管 |
| IAM Role | Bastion 用、RDS S3 復元用 |

## 前提条件

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.5.0
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html) がインストール済み
- AWS へのログインが完了していること (下記コマンドで確認)
  ```bash
  aws sts get-caller-identity
  ```
  Account と Arn が表示されれば OK です。エラーになる場合は認証情報が未設定または期限切れです。

  > 名前付きプロファイルを使用している場合は `--profile <プロファイル名>` を付けてください。
  > 以降の手順でも AWS CLI / Terraform が同じプロファイルを使うよう、事前に環境変数を設定しておくと便利です:
  > ```bash
  > export AWS_PROFILE=<プロファイル名>
  > ```
- 自分のグローバル IP アドレス (SSH 許可用)
  ```bash
  curl -s https://checkip.amazonaws.com
  ```

## ターミナルについて

本手順のコマンドはすべて Bash で記載しています。

| OS | 使用するターミナル |
|----|-------------------|
| **Windows** | [Git Bash](https://gitforwindows.org/) (Git for Windows に同梱) |
| **Mac** | Terminal.app または iTerm2 |

> **Windows の方へ:** PowerShell やコマンドプロンプトでは `chmod` や `$(...)` などの構文が動作しません。必ず **Git Bash** を使用してください。

## セットアップ

このフォルダ (`iac/terraform/aws/rds-sqlserver/`) に `cd` してから作業を開始してください。

```bash
cd iac/terraform/aws/rds-sqlserver/
```

### 1. 変数ファイルの作成

```bash
cp terraform.tfvars.example terraform.tfvars
```

### 2. terraform.tfvars を編集

最低限変更が必要な項目:

```hcl
# 自分のグローバル IP に変更 (https://checkip.amazonaws.com で確認)
allowed_ssh_cidrs = [
  "<YOUR_IP>/32"
]

# 受講者ごとに一意のサフィックス (2-12文字、小文字英数字とハイフン)
owner_suffix = "<your-suffix>"
```

### 3. デプロイ

```bash
terraform init
terraform plan
terraform apply
```

RDS の作成には **15〜30分** かかります。

## デプロイ後の確認

### Outputs の確認

```bash
terraform output
```

| Output | 説明 |
|--------|------|
| `bastion_public_ip` | Bastion の パブリック IP |
| `rds_endpoint` | RDS のエンドポイント |
| `rds_port` | RDS のポート (1433) |
| `secret_name` | Secrets Manager のシークレット名 |
| `restore_s3_bucket` | バックアップ復元用 S3 バケット名 |

### SSH 秘密鍵の取得

```bash
terraform output -raw bastion_private_key_pem > ~/.ssh/bastion.pem
chmod 600 ~/.ssh/bastion.pem
```

### RDS への接続 (ポートフォワード)

**新しいターミナルウィンドウを開いて**、以下を実行してください。

```bash
# Bastion 経由でローカルの 1433 ポートに転送
ssh -i ~/.ssh/bastion.pem -L 1433:<RDS_ENDPOINT>:1433 ec2-user@<BASTION_PUBLIC_IP>
```

`<RDS_ENDPOINT>` と `<BASTION_PUBLIC_IP>` は `terraform output` で確認した値に置き換えてください。

> **重要:** このターミナルは開いたままにしてください。SSH セッションを閉じるとポートフォワードが切断されます。

ポートフォワードが確立されたら、ローカルから `localhost:1433` で SQL Server に接続できます。
以降の操作 (パスワード取得など) は **元のターミナル** で行ってください。

### RDS パスワードの取得

```bash
aws secretsmanager get-secret-value \
  --secret-id $(terraform output -raw secret_name) \
  --region ap-northeast-1 \
  --query SecretString \
  --output text
```

## サンプルデータベースのリストア (WideWorldImporters)

研修では [Wide World Importers](https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0) サンプルデータベース (OLTP Full) を使用します。

### 1. バックアップファイルのダウンロード

[リリースページ](https://github.com/Microsoft/sql-server-samples/releases/tag/wide-world-importers-v1.0) から **WideWorldImporters-Full.bak** をダウンロードしてください。

### 2. S3 バケットへアップロード

```bash
aws s3 cp WideWorldImporters-Full.bak \
  s3://$(terraform output -raw restore_s3_bucket)/
```

### 3. RDS でリストアを実行

SSMS や sqlcmd 等で RDS に接続し (ポートフォワード経由で `localhost,1433`)、以下の SQL を実行します。

```sql
EXEC msdb.dbo.rds_restore_database
  @restore_db_name = 'WideWorldImporters',
  @s3_arn_to_restore_from = 'arn:aws:s3:::<S3_BUCKET_NAME>/WideWorldImporters-Full.bak';
```

`<S3_BUCKET_NAME>` は `terraform output restore_s3_bucket` で確認した値に置き換えてください。

### 4. リストア状況の確認

リストアは非同期で実行されます。進捗は以下の SQL で確認できます。

```sql
EXEC msdb.dbo.rds_task_status @db_name = 'WideWorldImporters';
```

`lifecycle` が `SUCCESS` になればリストア完了です。完了までに **10〜20分** かかる場合があります。

## 他の受講者と RDS を共有する

RDS 作成者以外の受講者が同じ RDS にポートフォワードで接続する手順です。

### 接続者が行う手順 (準備)

1. SSH キーペアを生成します。

   ```bash
   ssh-keygen -t rsa -b 4096 -f ~/.ssh/bastion-shared
   ```

   パスフレーズは空のままで構いません。

2. 公開鍵の内容を RDS 作成者に送ります。

   ```bash
   cat ~/.ssh/bastion-shared.pub
   ```

3. 自分のグローバル IP を確認して RDS 作成者に伝えます。

   ```bash
   curl -s https://checkip.amazonaws.com
   ```

### RDS 作成者が行う手順

1. `terraform.tfvars` の `allowed_ssh_cidrs` に接続者の IP を追加します。

   ```hcl
   allowed_ssh_cidrs = [
     "自分のIP/32",
     "<接続者のIP>/32"   # 追加
   ]
   ```

2. Terraform を適用します。

   ```bash
   terraform apply
   ```

3. Bastion に SSH して接続者の公開鍵を追加します。

   ```bash
   ssh -i ~/.ssh/bastion.pem ec2-user@<BASTION_PUBLIC_IP>
   ```

   Bastion 上で以下を実行:

   ```bash
   echo '<接続者の公開鍵>' >> ~/.ssh/authorized_keys
   exit
   ```

   `<接続者の公開鍵>` は接続者から受け取った `ssh-rsa AAAA...` の文字列全体です。

4. 以下の情報を接続者に共有します。
   - Bastion のパブリック IP (`terraform output bastion_public_ip`)
   - RDS エンドポイント (`terraform output rds_endpoint`)
   - DB パスワード (「RDS パスワードの取得」を参照)

### 接続者が行う手順 (接続)

1. **新しいターミナルウィンドウを開いて**、ポートフォワードを実行します。

   ```bash
   ssh -i ~/.ssh/bastion-shared -L 1433:<RDS_ENDPOINT>:1433 ec2-user@<BASTION_PUBLIC_IP>
   ```

   `<RDS_ENDPOINT>` と `<BASTION_PUBLIC_IP>` は RDS 作成者から共有された値に置き換えてください。

2. ポートフォワードが確立されたら、ローカルから `localhost:1433` で SQL Server に接続できます。

## 環境の削除

研修終了後は忘れずにリソースを削除してください。

```bash
terraform destroy
```

## 注意事項

- `terraform.tfvars` には自分の IP アドレスが含まれるため、**Git にコミットしないでください** (`.gitignore` に含まれています)
- `terraform.tfstate` にはシークレット情報が平文で含まれます。取り扱いに注意してください
- S3 バケット内のファイルは 7日 で自動削除されます
- RDS のメンテナンスウィンドウは日曜 03:00-04:00 JST、バックアップは毎日 02:00-03:00 JST に設定されています
