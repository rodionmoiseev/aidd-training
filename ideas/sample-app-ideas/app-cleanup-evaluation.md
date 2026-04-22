# クリーンアップ評価 / Cleanup Evaluation

研修終了後、各アプリの前提条件をどれだけ簡単に削除できるかの評価。

Evaluation of how easy it is to remove each app's prerequisites after training completion.

---

## クリーンアップ難易度マトリックス / Cleanup Difficulty Matrix

| 前提条件 / Prerequisite | 削除難易度 / Cleanup Difficulty | 削除推奨 / Recommend Removing | 理由 / Reason |
|------------------------|-------------------------------|----------------------------|--------------|
| **プロジェクトファイル / Project files** | ⭐☆☆☆☆（非常に簡単） | ✅ はい | フォルダ削除のみ / Just delete folder |
| **SQLite データベース** | ⭐☆☆☆☆（非常に簡単） | ✅ はい | .dbファイル削除のみ / Just delete .db files |
| **データセットファイル** | ⭐☆☆☆☆（非常に簡単） | ✅ はい | フォルダ削除のみ / Just delete folder |
| **npm パッケージ** | ⭐☆☆☆☆（非常に簡単） | ✅ はい | node_modules削除 / Delete node_modules |
| **PostgreSQL** | ⭐⭐⭐☆☆（中） | △ 任意 | Windowsアンインストーラー使用 / Use Windows uninstaller |
| **Redis** | ⭐⭐☆☆☆（やや簡単） | ✅ はい | サービス停止→アンインストール / Stop service → uninstall |
| **Python パッケージ** | ⭐☆☆☆☆（非常に簡単） | ✅ はい | pip uninstall / pip uninstall |
| **Node.js** | ⭐⭐☆☆☆（やや簡単） | ❌ いいえ | 他プロジェクトで有用 / Useful for other projects |
| **Git** | ⭐⭐☆☆☆（やや簡単） | ❌ いいえ | 他プロジェクトで有用 / Useful for other projects |
| **VS Code** | ⭐⭐☆☆☆（やや簡単） | ❌ いいえ | 他プロジェクトで有用 / Useful for other projects |
| **Claude Code Extension** | ⭐☆☆☆☆（非常に簡単） | △ 任意 | VS Code拡張機能から削除 / Remove from VS Code extensions |
| **Chrome** | ⭐⭐☆☆☆（やや簡単） | ❌ いいえ | 日常的に使用 / Used daily |
| **GitHub アカウント** | N/A | ❌ いいえ | 外部サービス / External service |
| **AWS アカウント** | ⭐⭐⭐⭐☆（難） | △ 任意 | リソース削除が必要 / Requires resource cleanup |

---

## アプリ別クリーンアップ詳細 / App-Specific Cleanup Details

### アイデア2: 議事録自動生成アシスタント / Meeting Minutes Assistant

#### 削除が必要なもの / Items to Remove

**必須削除（容量節約） / Must Remove (Save Space)**:
```bash
# プロジェクトフォルダ削除 / Delete project folder
rm -rf ~/meeting-minutes-assistant

# データセット削除 / Delete datasets
rm -rf ~/data/meetings/AMI-Corpus
rm -rf ~/data/meetings/QMSum

# 推定解放容量 / Estimated space freed: ~5-10 GB
```

**オプション削除 / Optional Removal**:
```bash
# PostgreSQL アンインストール（Windowsコントロールパネルから）
# Uninstall PostgreSQL (from Windows Control Panel)
# 解放容量 / Space freed: ~200-300 MB

# Redis アンインストール（使用した場合）
# Uninstall Redis (if used)
# 解放容量 / Space freed: ~10-20 MB
```

**削除不要（他で使用可能） / Keep (Reusable)**:
- Node.js
- Git
- VS Code
- Chrome

**クリーンアップ総合評価 / Overall Cleanup Rating**: ⭐⭐⭐⭐⭐ （非常に簡単 / Very Easy）

**推定クリーンアップ時間 / Estimated Cleanup Time**: 5-10分 / 5-10 minutes

---

### アイデア3: ドキュメント翻訳＆レビューシステム / Document Translation & Review System

#### 削除が必要なもの / Items to Remove

**必須削除（容量節約） / Must Remove (Save Space)**:
```bash
# プロジェクトフォルダ削除 / Delete project folder
rm -rf ~/translation-review-system

# データセット削除 / Delete datasets
rm -rf ~/data/translation/JESC
rm -rf ~/data/translation/JParaCrawl
rm -rf ~/data/translation/Tatoeba

# 推定解放容量 / Estimated space freed: ~15-20 GB
# (JParaCrawlが大きい / JParaCrawl is large)
```

**オプション削除 / Optional Removal**:
```bash
# PostgreSQL アンインストール（既に削除済みでなければ）
# Uninstall PostgreSQL (if not already removed)

# Redis アンインストール（使用した場合）
# Uninstall Redis (if used)
```

**削除不要（他で使用可能） / Keep (Reusable)**:
- Node.js
- Git
- VS Code
- Chrome

**クリーンアップ総合評価 / Overall Cleanup Rating**: ⭐⭐⭐⭐⭐ （非常に簡単 / Very Easy）

**推定クリーンアップ時間 / Estimated Cleanup Time**: 5-10分 / 5-10 minutes

---

### アイデア4: SQL×AIエージェントアプリ / SQL×AI Agent Application

#### 削除が必要なもの / Items to Remove

**必須削除（容量節約） / Must Remove (Save Space)**:
```bash
# プロジェクトフォルダ削除 / Delete project folder
rm -rf ~/sql-ai-agent

# Chinookデータベース削除 / Delete Chinook database
rm -f ~/data/chinook/Chinook_Sqlite.sqlite
rm -f ~/data/chinook/Chinook_PostgreSql.sql

# MCP サーバーパッケージ削除 / Delete MCP server packages
# (プロジェクトのnode_modulesに含まれるため上記で削除済み)
# (Included in project node_modules, already deleted above)

# 推定解放容量 / Estimated space freed: ~2-5 GB
```

**オプション削除 / Optional Removal**:
```bash
# PostgreSQL アンインストール（既に削除済みでなければ）
# Uninstall PostgreSQL (if not already removed)

# DynamoDB Local 削除（使用した場合）
# Delete DynamoDB Local (if used)
rm -rf ~/dynamodb_local
# 解放容量 / Space freed: ~50-100 MB
```

**削除不要（他で使用可能） / Keep (Reusable)**:
- Node.js
- Git
- VS Code
- Chrome

**クリーンアップ総合評価 / Overall Cleanup Rating**: ⭐⭐⭐⭐⭐ （非常に簡単 / Very Easy）

**推定クリーンアップ時間 / Estimated Cleanup Time**: 5-10分 / 5-10 minutes

---

### （参考）アイデア1: 顧客問い合わせ対応アシスタント / Customer Inquiry Response Assistant

#### 削除が必要なもの / Items to Remove

**必須削除（容量節約） / Must Remove (Save Space)**:
```bash
# プロジェクトフォルダ削除 / Delete project folder
rm -rf ~/customer-inquiry-assistant

# データセット削除 / Delete datasets
rm -rf ~/data/customer-inquiry/stackoverflow.com-Posts.7z
rm -rf ~/data/customer-inquiry/stackoverflow-posts/

# 推定解放容量 / Estimated space freed: ~30-50 GB
# (Stack Exchange dumpが非常に大きい / Stack Exchange dump is very large)
```

**オプション削除 / Optional Removal**:
```bash
# Python アンインストール（他で使用しない場合）
# Uninstall Python (if not used elsewhere)
# 解放容量 / Space freed: ~100-200 MB

# FastAPI関連パッケージ削除
# Delete FastAPI-related packages
pip uninstall fastapi uvicorn sqlalchemy psycopg2
```

**削除不要（他で使用可能） / Keep (Reusable)**:
- Node.js
- Git
- VS Code
- Chrome

**クリーンアップ総合評価 / Overall Cleanup Rating**: ⭐⭐⭐⭐☆ （簡単 / Easy）

**推定クリーンアップ時間 / Estimated Cleanup Time**: 10-15分 / 10-15 minutes

---

## AWS リソースのクリーンアップ / AWS Resource Cleanup

### 重要 / Important
**研修後、必ずAWSリソースを削除してください！** 削除しないと継続的に課金される可能性があります。

**You MUST delete AWS resources after training!** Otherwise, you may incur ongoing charges.

### クリーンアップ手順 / Cleanup Steps

#### ステップ1: Terraformで削除（推奨） / Step 1: Delete with Terraform (Recommended)

```bash
# プロジェクトディレクトリに移動 / Navigate to project directory
cd ~/meeting-minutes-assistant

# Terraform destroy実行 / Run Terraform destroy
terraform destroy

# 確認を求められたら "yes" と入力 / Type "yes" when prompted
```

**推定削除時間 / Estimated Deletion Time**: 5-10分 / 5-10 minutes

#### ステップ2: 手動確認 / Step 2: Manual Verification

```bash
# RDS インスタンス確認 / Verify RDS instances
aws rds describe-db-instances

# Lambda 関数確認 / Verify Lambda functions
aws lambda list-functions

# S3 バケット確認 / Verify S3 buckets
aws s3 ls

# DynamoDB テーブル確認 / Verify DynamoDB tables
aws dynamodb list-tables

# CloudFront ディストリビューション確認 / Verify CloudFront distributions
aws cloudfront list-distributions
```

#### ステップ3: 残存リソース削除 / Step 3: Delete Remaining Resources

Terraformで削除されなかったリソースがある場合:

If Terraform didn't delete some resources:

```bash
# RDS 削除 / Delete RDS
aws rds delete-db-instance \
  --db-instance-identifier meeting-assistant-db \
  --skip-final-snapshot

# Lambda 削除 / Delete Lambda
aws lambda delete-function --function-name meeting-assistant

# S3 バケット削除（バケットを空にしてから）
# Delete S3 bucket (empty it first)
aws s3 rm s3://meeting-assistant-frontend --recursive
aws s3 rb s3://meeting-assistant-frontend

# DynamoDB テーブル削除 / Delete DynamoDB table
aws dynamodb delete-table --table-name meeting-assistant-sessions
```

### AWSクリーンアップ評価 / AWS Cleanup Rating

| リソース / Resource | 削除難易度 / Difficulty | Terraform対応 / Terraform Support |
|-------------------|----------------------|--------------------------------|
| Lambda | ⭐☆☆☆☆ | ✅ 自動削除 / Auto-deleted |
| API Gateway | ⭐☆☆☆☆ | ✅ 自動削除 / Auto-deleted |
| RDS | ⭐⭐☆☆☆ | ✅ 自動削除 / Auto-deleted |
| S3 | ⭐⭐⭐☆☆ | ⚠️ バケットを空にする必要あり / Must empty first |
| CloudFront | ⭐⭐⭐☆☆ | ✅ 自動削除 / Auto-deleted |
| DynamoDB | ⭐☆☆☆☆ | ✅ 自動削除 / Auto-deleted |

**AWS クリーンアップ総合評価 / Overall AWS Cleanup Rating**: ⭐⭐⭐⭐☆ （簡単 / Easy）

**推定クリーンアップ時間 / Estimated Cleanup Time**: 10-20分 / 10-20 minutes

---

## 完全クリーンアップチェックリスト / Complete Cleanup Checklist

### 即時削除（容量節約） / Immediate Deletion (Save Space)

- [ ] プロジェクトフォルダ削除 / Delete project folders
- [ ] データセットフォルダ削除 / Delete dataset folders
- [ ] SQLite データベースファイル削除 / Delete SQLite database files
- [ ] AWSリソース削除（Terraform destroy） / Delete AWS resources (Terraform destroy)
- [ ] AWS手動確認・残存リソース削除 / Manual AWS verification & cleanup

**推定合計削除容量 / Total Space Freed**: 20-50 GB

**推定合計時間 / Total Time**: 20-40分 / 20-40 minutes

### 任意削除（追加容量節約） / Optional Deletion (Additional Space)

- [ ] PostgreSQL アンインストール / Uninstall PostgreSQL (~200-300 MB)
- [ ] Redis アンインストール / Uninstall Redis (~10-20 MB)
- [ ] Python アンインストール（顧客問い合わせアプリの場合）/ Uninstall Python (for Customer Inquiry app) (~100-200 MB)
- [ ] Claude Code Extension 削除 / Remove Claude Code Extension (minimal space)

**推定追加削除容量 / Additional Space Freed**: 300-500 MB

### 削除非推奨（他で使用） / Not Recommended (Reusable)

- [ ] ~~Node.js~~ (他プロジェクトで有用 / Useful for other projects)
- [ ] ~~Git~~ (他プロジェクトで有用 / Useful for other projects)
- [ ] ~~VS Code~~ (他プロジェクトで有用 / Useful for other projects)
- [ ] ~~Chrome~~ (日常的に使用 / Used daily)

---

## クリーンアップ自動化スクリプト / Automated Cleanup Script

### Windows PowerShell

```powershell
# cleanup.ps1
# 研修プロジェクト完全削除スクリプト / Complete training project cleanup script

Write-Host "=== AI駆動開発研修 クリーンアップスクリプト ===" -ForegroundColor Green
Write-Host "=== AI-Driven Development Training Cleanup ===" -ForegroundColor Green
Write-Host ""

# プロジェクトフォルダ削除 / Delete project folders
Write-Host "プロジェクトフォルダを削除しています... / Deleting project folders..." -ForegroundColor Yellow
Remove-Item -Recurse -Force "$HOME\meeting-minutes-assistant" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$HOME\translation-review-system" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$HOME\sql-ai-agent" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$HOME\customer-inquiry-assistant" -ErrorAction SilentlyContinue
Write-Host "✓ プロジェクトフォルダ削除完了 / Project folders deleted" -ForegroundColor Green

# データセット削除 / Delete datasets
Write-Host "データセットを削除しています... / Deleting datasets..." -ForegroundColor Yellow
Remove-Item -Recurse -Force "$HOME\data\meetings" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$HOME\data\translation" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$HOME\data\chinook" -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force "$HOME\data\customer-inquiry" -ErrorAction SilentlyContinue
Write-Host "✓ データセット削除完了 / Datasets deleted" -ForegroundColor Green

# AWS リソース削除確認 / AWS resource deletion check
Write-Host ""
Write-Host "重要: AWSリソースを手動で削除してください！ / IMPORTANT: Manually delete AWS resources!" -ForegroundColor Red
Write-Host "実行コマンド / Run command:" -ForegroundColor Yellow
Write-Host "  cd <project-folder>" -ForegroundColor Cyan
Write-Host "  terraform destroy" -ForegroundColor Cyan
Write-Host ""

Write-Host "=== クリーンアップ完了 / Cleanup Complete ===" -ForegroundColor Green
Write-Host "削除された容量: 約20-50GB / Space freed: approximately 20-50GB"
```

### 使用方法 / Usage

```powershell
# スクリプト実行 / Run script
powershell -ExecutionPolicy Bypass -File cleanup.ps1
```

---

## 総合評価 / Overall Evaluation

### アプリ別クリーンアップ容易性ランキング / Cleanup Ease Ranking by App

| ランク | アプリ | クリーンアップ難易度 | 推定時間 | 削除容量 |
|-------|------|------------------|---------|---------|
| 🥇 1位 | **SQL×AIエージェント** | ⭐⭐⭐⭐⭐（非常に簡単） | 5-10分 | 2-5 GB |
| 🥈 2位 | **議事録自動生成** | ⭐⭐⭐⭐⭐（非常に簡単） | 5-10分 | 5-10 GB |
| 🥉 3位 | **翻訳＆レビュー** | ⭐⭐⭐⭐⭐（非常に簡単） | 5-10分 | 15-20 GB |
| 4位 | **顧客問い合わせ** | ⭐⭐⭐⭐☆（簡単） | 10-15分 | 30-50 GB |

### 結論 / Conclusion

**すべての推奨アプリは非常にクリーンアップが簡単です！**

**All recommended apps are very easy to clean up!**

**主な理由 / Main Reasons**:
- ✅ Docker不要 → コンテナ・イメージ削除不要 / No Docker → No container/image cleanup
- ✅ WSL2不要 → 仮想環境削除不要 / No WSL2 → No virtual environment cleanup
- ✅ ファイルベース → フォルダ削除のみ / File-based → Just delete folders
- ✅ Terraform対応 → AWS自動削除 / Terraform support → Automated AWS cleanup

**最も時間がかかる部分 / Most Time-Consuming Part**: AWS リソース削除（10-20分）/ AWS resource deletion (10-20 minutes)

**最も容量を節約できる部分 / Most Space Savings**: データセット削除（20-50GB）/ Dataset deletion (20-50GB)
