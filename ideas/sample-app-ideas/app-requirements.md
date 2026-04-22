# 研修前提条件 / Training Prerequisites

## 目的 / Purpose

この文書は、AI駆動開発研修（全5回）に参加する前に準備すべき環境・知識・データを整理したものです。
研修開始時に全員が同じスタートラインに立てるよう、事前に確認・準備をお願いします。

This document consolidates the environment, knowledge, and data that participants should prepare before the AI-driven development training (5 sessions).
Please verify and prepare these items in advance so everyone starts on the same page.

---

## 1. 対象者プロファイル / Target Audience Profile

### 日本語

**受講者背景**:
- **業種**: SI（システムインテグレーション）ビジネス
- **職種**: プリセールスエンジニア
- **エンジニアリングスキル**: レベル2〜3混在（チーム開発での実装・レビュー経験あり、一部クラウドアーキテクチャ設計経験者も含む）
- **GitHub利用経験**: レベル0〜2混在（未経験者からGitHub Actions経験者まで）
- **アジャイル開発経験**: レベル1〜3混在
- **AIコーディングツール経験**: レベル1〜3混在

**設計方針**:
- スキル差が大きい前提で、必須要件＋発展要件の二層構造を採用
- ペア/グループワークで経験者が未経験者をサポート
- セキュリティ観点は受講者要望により全セッションに組み込み

### English

**Participant Background**:
- **Industry**: SI (System Integration) business
- **Role**: Pre-sales engineers
- **Engineering Skills**: Mixed L2-L3 (team implementation + code review experience, some with cloud architecture design experience)
- **GitHub Experience**: Mixed L0-L2 (from no hands-on experience to GitHub Actions CI/CD)
- **Agile Experience**: Mixed L1-L3
- **AI Coding Tool Experience**: Mixed L1-L3

**Design Approach**:
- Two-tier structure (required + stretch goals) to accommodate skill gaps
- Pair/group work where experienced participants support beginners
- Security embedded across all sessions per participant request

---

## 2. 研修構成 / Training Structure

### 日本語

| セッション | 時間 | テーマ | 主な内容 |
|----------|------|--------|---------|
| **第1回** | 2h | 環境セットアップ / AI駆動開発概要 | Claude Code導入、MCP概念、セキュリティ概観 |
| **第2回** | 4h | バイブコーディング体験 | 議事録自動生成アシスタント実装、ペア相互評価、再現性のある失敗体験 |
| **第3回** | 4h | プロトタイピング① | アプリ骨格構築、参照アーキテクチャに沿った開発 |
| **第4回** | 4h | プロトタイピング② | MCP実接続、会話履歴、機能改善 |
| **第5回** | 4h | AWSデプロイメント | クラウド化、CI/CD、セキュリティ本番対応 |

### English

| Session | Duration | Theme | Key Content |
|---------|----------|-------|-------------|
| **Session 1** | 2h | Environment Setup / AI-Driven Development Overview | Claude Code setup, MCP concept, security overview |
| **Session 2** | 4h | Vibe Coding Experience | Expense app, peer review, reproducible failure experience |
| **Session 3** | 4h | Prototyping ① | App skeleton, development along reference architecture |
| **Session 4** | 4h | Prototyping ② | Real MCP connection, conversation history, feature improvements |
| **Session 5** | 4h | AWS Deployment | Cloud migration, CI/CD, production security |

---

## 3. 技術前提条件（第1回開始前） / Technical Prerequisites (Before Session 1)

### 必須ソフトウェア / Required Software

| ツール | バージョン | 用途 | インストール方法 |
|-------|----------|------|----------------|
| **VS Code** | 最新版 | 統合開発環境 | https://code.visualstudio.com/ |
| **Claude Code Extension** | 最新版 | AI駆動開発ツール | VS Code Marketplaceから検索・インストール |
| **Node.js** | LTS (v20+) | ローカル開発環境 | https://nodejs.org/ |
| **Git** | 最新版 | バージョン管理 | https://git-scm.com/downloads |
| **Google Chrome** | 最新版 | 開発者ツール（第2回で使用） | https://www.google.com/chrome/ |

**動作確認コマンド**:
```bash
node -v    # v20以上
npm -v     # 10以上
git --version
```

### 必須アカウント / Required Accounts

#### GitHub アカウント（重要 / Important）

**タイムライン**:
- ✅ **研修1週間前まで**: アカウント作成・確認アンケート回答
- ✅ **研修開始時**: アカウント有効性確認（clone/push動作確認）

**未所持の場合**:
1. https://github.com/ でアカウント作成（無料）
2. 講師から招待される研修用プライベートリポジトリへのアクセスを承認
3. `git clone` / `git push` が動作することを確認

#### LLM アクセス（いずれか1つ / Either one）

| オプション | アクセス方法 | 備考 |
|----------|------------|------|
| **Amazon Bedrock Claude** | AWSアカウント + Bedrock有効化 | 初期アカウントではTPS=0の場合あり |
| **Anthropic Claude API** | https://console.anthropic.com/ | 従量課金（研修全体で数十ドル想定） |

**推奨**: 両方準備しておくと安心（環境変数で切り替え可能な設計）

### データベース / Database

#### ローカル開発（第3〜4回） / Local Development (Sessions 3-4)

**SQLite + better-sqlite3（推奨 / Recommended）**:
- ✅ **Dockerインストール不要**
- ✅ Windows + AWS Workspaces 環境で動作確認済み
- ✅ `npm install better-sqlite3` のみで導入完了
- ✅ ファイルベースなのでバックアップ・配布が容易

```bash
# インストール確認
npm install better-sqlite3
node -e "const db = require('better-sqlite3'); console.log('SQLite OK');"
```

**PostgreSQL（オプション / Optional）**:
- Windows インストーラー: https://www.postgresql.org/download/windows/
- Mac: `brew install postgresql`
- 発展課題として、ローカルでもPostgreSQLを使いたい場合のみ

#### クラウド（第5回） / Cloud (Session 5)

- **Amazon RDS for PostgreSQL** (db.t3.micro / db.t4g.micro)
- AWS Free Tier: 750時間/月（12ヶ月間）

### Docker & WSL2 ポリシー / Docker & WSL2 Policy

**重要 / Important**: **Docker と WSL2 は研修の必須要件ではありません / Docker and WSL2 are NOT required for this training**

**理由 / Rationale**:
- ❌ **WSL2 は使用不可 / WSL2 cannot be used**: 仮想化Windows環境（AWS Workspaces、Azure Virtual Desktop等）ではWSL2が動作しない
- ❌ **Docker Desktop は使用不可 / Docker Desktop cannot be used**: Windows版Docker DesktopはWSL2を必要とするため使用不可
- ✅ **代替手段で完結 / Alternative solution is sufficient**: SQLite + better-sqlite3 でDocker不要のローカル開発が可能
- ✅ **クラウド移行も問題なし / Cloud migration works fine**: 第5回でクラウド（RDS PostgreSQL）に移行する際も、MCP抽象化により影響なし

**厳に回避すべき技術 / Technologies to Strictly Avoid**:
- ❌ WSL2（Windows Subsystem for Linux 2）- 仮想化Windows環境で動作しない
- ❌ Docker Desktop for Windows - WSL2を必要とするため仮想化環境で困難
- ❌ Docker Compose - Docker Desktopに依存するため回避
- ❌ Linux仮想マシン - ネストされた仮想化は仮想化環境で動作しない

**理由 / Reason**: 研修参加者の一部がAWS Workspaces等の仮想化Windows環境を使用するため、全員が同じ環境で学習できるよう上記技術を使用しない設計とします。

**Reason**: Since some participants use virtualized Windows environments (AWS Workspaces, etc.), we avoid these technologies to ensure all participants can learn in the same environment.

**利用可能なツール / Allowed Tools**:
- ✅ Node.js（Windows ネイティブ）
- ✅ PostgreSQL（Windows インストーラー）※オプション
- ✅ SQLite + better-sqlite3（Windows ネイティブ）
- ✅ Git Bash（簡単なシェルスクリプト用）
- ✅ PowerShell（Windows標準）

**非仮想化Windows環境の受講者向け / For non-virtualized Windows participants**:
- Docker が技術的に使える環境の方も、**研修では使用しない** ことを強く推奨
  - 理由: 全受講者が同じ環境で学習し、講師が統一サポートできるようにするため
  - 仮想化環境の受講者と同じ手順で進めることで、相互サポートも容易になる
- Docker/WSL2 を個人的に試したい場合は、研修外で別途実施してください（講師サポート対象外）

---

## 4. アプリケーション選択肢 / Application Options

研修では以下のいずれかのアプリケーションを構築します。

The training will build one of the following applications:

### オプションA: 議事録自動生成 + 文書翻訳 / Option A: Meeting Minutes + Document Translation

**推奨理由 / Recommended because**:
- ✅ Docker完全不要
- ✅ **WSL2完全不要** - Windows ネイティブで完結
- ✅ AWS Free Tier完全適合（$0/月 × 12ヶ月）
- ✅ プリセールスエンジニア業務に直結
- ✅ 高品質なオープンデータが豊富

**構成 / Structure**:
- **第2回**: 議事録自動生成アシスタント（バイブコーディング）
- **第3〜5回**: 文書翻訳＆レビューシステム（プロトタイプ → 機能改善 → AWS）

**使用データセット**:
- AMI Meeting Corpus (CC-BY 4.0) - 100時間の会議記録
- QMSum (MIT) - 1,808件の会議トランスクリプト
- JESC (CC-BY 4.0) - 320万日英文ペア
- JParaCrawl (CC0) - 1000万日英文ペア

### オプションB: SQL×AI エージェント / Option B: SQL×AI Agent

**推奨理由 / Recommended because**:
- ✅ 自然言語 → SQL → 可視化の実用的フロー
- ✅ **WSL2完全不要** - Windows ネイティブで完結
- ✅ MCP学習に最適（DB接続を題材に段階的理解）
- ✅ Chinookサンプルデータで本格的なクエリ体験

**構成 / Structure**:
- **第2回**: 経費精算アプリ（バイブコーディング）
- **第3〜5回**: SQL×AIエージェント（Chinookデータベースへの自然言語クエリ）

**使用データセット**:
- Chinook Database (SQLite版 / PostgreSQL版)
  - 音楽ストアの架空データ（顧客・請求・アーティスト・トラック等）
  - 11テーブル、複数の結合・集計クエリに対応

---

## 5. データセット要件 / Dataset Requirements

### 必須条件 / Required Criteria

- ✅ **Kaggleアカウント不要**: アーカイブ・GitHubから直接ダウンロード可能
- ✅ **オープンライセンス**: CC-BY, CC0, MIT, Apache, ODbL等
- ✅ **ログイン不要**: `wget` / `curl` で直接取得可能

### ダウンロード方法 / Download Methods

#### AMI Meeting Corpus
```bash
wget http://groups.inf.ed.ac.uk/ami/AMICorpusFull/amicorpus/ES2002a.zip
unzip ES2002a.zip
```

#### QMSum
```bash
git clone https://github.com/Yale-LILY/QMSum.git
```

#### JESC (日英字幕コーパス / Japanese-English Subtitle Corpus)
```bash
wget https://nlp.stanford.edu/projects/jesc/data/split.tar.gz
tar -xzf split.tar.gz
```

#### JParaCrawl
```bash
wget http://www.kecl.ntt.co.jp/icl/lirg/jparacrawl/release/3.0/bitext/en-ja.tar.gz
tar -xzf en-ja.tar.gz
```

#### Chinook Database
```bash
# SQLite版
wget https://github.com/lerocha/chinook-database/raw/master/ChinookDatabase/DataSources/Chinook_Sqlite.sqlite

# PostgreSQL版（AWS RDS用）
wget https://github.com/lerocha/chinook-database/raw/master/ChinookDatabase/DataSources/Chinook_PostgreSql.sql
```

**自動化スクリプト / Automation Script**:
研修リポジトリに `scripts/download_datasets.sh` を用意予定

---

## 6. セッション別前提条件 / Session-specific Prerequisites

### 第1回開始前 / Before Session 1

- ✅ VS Code + Claude Code Extension インストール済み
- ✅ Node.js インストール済み（`node -v` で確認）
- ✅ Git インストール済み（`git --version` で確認）
- ✅ GitHub アカウント作成済み

### 第2回開始前 / Before Session 2
（第1回終了時に宿題としてアナウンス）

- ✅ Google Chrome インストール済み（DevTools使用のため）
- 📝 （任意）経費精算アプリのイメージを軽く考えてくる

### 第3回開始前 / Before Session 3
（第2回終了時に宿題としてアナウンス）

- ✅ Node.js 動作確認（`npm install` が通ること）
- 📝 SQL基礎の軽い復習（未経験者向け参考資料を配布）
- 📦 Chinook データベースダウンロード（または研修リポジトリに同梱）

### 第4回開始前 / Before Session 4
（第3回終了時に宿題としてアナウンス）

- ✅ PostgreSQL MCP サーバーパッケージ事前取得（`npm install` 等）
- 📝 自分のアプリで「対話履歴を持たせたい」イメージを軽く考える

### 第5回開始前 / Before Session 5
（第4回終了時に宿題としてアナウンス）

- ✅ AWS アカウント準備・動作確認（`aws sts get-caller-identity` が通ること）
- ✅ AWS CLI インストール確認
- ✅ Terraform インストール確認
- 📝 （任意）アプリコードの整理（余計なブランチ・中途半端な変更を整理）

---

## 7. AWS デプロイメント要件（第5回） / AWS Deployment Requirements (Session 5)

### AWS Free Tier アーキテクチャ / AWS Free Tier Architecture

#### ローカル開発 / Local Development

```
React (Vite dev server)
  ↓
Node.js (ローカル実行)
  ↓
SQLite (better-sqlite3)
```

**月額コスト / Monthly Cost**: $0

#### クラウド（AWS） / Cloud (AWS)

```
CloudFront (CDN)
  ↓
S3 (静的サイトホスティング)
  ↓
API Gateway (REST API)
  ↓
Lambda (Container Image) or EC2 t2.micro
  ↓
RDS for PostgreSQL (db.t3.micro)
```

**月額コスト / Monthly Cost**: 
- **最初の12ヶ月 / First 12 months**: $0（Free Tier内）
- **12ヶ月後 / After 12 months**: ~$25-30/月

### AWS Free Tier 制限 / AWS Free Tier Limits

| サービス | Free Tier制限 | 12ヶ月後のコスト（参考） |
|---------|--------------|---------------------|
| **EC2 t2.micro** | 750時間/月（12ヶ月） | ~$8-10/月 |
| **RDS db.t3.micro** | 750時間/月（12ヶ月） | ~$15-20/月 |
| **Lambda** | 100万リクエスト/月（常時無料） | 制限超過分のみ課金 |
| **API Gateway** | 100万コール/月（12ヶ月） | 制限超過分のみ課金 |
| **S3** | 5GB + 20,000 GET + 2,000 PUT/月（常時無料） | 制限超過分のみ課金 |
| **CloudFront** | 50GB転送 + 200万リクエスト/月（12ヶ月） | 制限超過分のみ課金 |
| **DynamoDB** | 25GB + 25 RCU/WCU（常時無料） | 制限超過分のみ課金 |

### コスト監視設定 / Cost Monitoring Setup

**研修前に設定推奨**:
```bash
# AWS Budgets アラート（$1超過で通知）
aws budgets create-budget \
  --account-id [ACCOUNT_ID] \
  --budget '{
    "BudgetName": "FreeTierAlert",
    "BudgetLimit": {"Amount": "1", "Unit": "USD"},
    "TimeUnit": "MONTHLY",
    "BudgetType": "COST"
  }'
```

### クリーンアップ / Cleanup

**重要 / Important**: 研修終了後、必ず以下を実行してリソース削除

```bash
# Terraform でデプロイした場合
terraform destroy

# 手動確認
aws rds describe-db-instances
aws lambda list-functions
aws s3 ls
```

---

## 8. セキュリティ要件（横断的） / Security Requirements (Cross-cutting)

研修全体を通じて、以下のセキュリティトピックを段階的に学習します。

Security topics are embedded progressively across all sessions:

### 第1回: セキュリティ概観 / Session 1: Security Overview

- プロンプトインジェクション（外部ソースからの指示にLLMが従うリスク）
- 機密情報の扱い（APIキー・個人情報をプロンプトに入れない）
- 生成コードの鵜呑み禁止
- ツール権限の考え方（MCPサーバーが何にアクセスできるか）

### 第2回: 実践的セキュリティレビュー / Session 2: Hands-on Security Review

- Chrome DevTools で機密情報・APIキーの露出を確認
- クライアント側のみのバリデーションの危険性
- 認証不在のアプリが抱えるリスク
- ペイロード改ざんの試行

### 第3回: MCP 権限設計 / Session 3: MCP Permission Design

- MCPサーバーの権限範囲（何をさせるか／させないか）
- ファイルシステムアクセスの制限
- GitHub等外部サービスへのアクセス制御

### 第4回: データセキュリティ / Session 4: Data Security

- SQLインジェクション対策
- 会話履歴に機密情報を入れない設計
- パラメータ化クエリの重要性

### 第5回: AWS セキュリティ / Session 5: AWS Security

- IAM 最小権限の原則
- AWS Secrets Manager でのシークレット管理
- VPC エンドポイント / セキュリティグループ設計
- CloudWatch Logs への機密情報漏洩防止
- CI/CD 用ロールの権限設計

---

## 9. AWS Workspaces 環境確認 / AWS Workspaces Environment Verification

### 仮想化Windows環境で研修を受ける場合の事前確認 / Pre-verification for Virtualized Windows

**対象環境 / Target Environments**:
- AWS Workspaces
- Azure Virtual Desktop
- Citrix Virtual Apps
- その他の仮想化Windows環境 / Other virtualized Windows environments

### ✅ 動作確認済みツール / Verified Working Tools

以下のツールはすべて仮想化Windows環境で動作することを確認済みです:

The following tools are verified to work in virtualized Windows environments:

```bash
# 1. Node.js (Windows ネイティブ / Windows native)
node -v
npm -v

# 2. Python (Windows ネイティブ / Windows native)
python --version
pip --version

# 3. Git (Windows ネイティブ / Windows native)
git --version

# 4. PostgreSQL (Windows インストーラー / Windows installer)
psql --version

# 5. SQLite (Node.js パッケージ / Node.js package)
npm install better-sqlite3
node -e "const db = require('better-sqlite3'); console.log('SQLite OK');"
```

### ❌ 使用不可なツール / Tools That Won't Work

以下のツールは仮想化Windows環境では動作しません（使用禁止）:

The following tools will NOT work in virtualized Windows (prohibited):

```bash
# ❌ WSL2 (動作不可 / Won't work)
wsl --version  # エラーになる / Will error

# ❌ Docker Desktop (WSL2必須のため動作不可 / Won't work, requires WSL2)
docker --version  # インストール不可 / Cannot install

# ❌ VirtualBox/VMware (ネストされた仮想化不可 / Nested virtualization not allowed)
```

### 事前確認コマンド / Pre-verification Commands

研修開始前に以下のコマンドを実行し、環境を確認してください:

Run these commands before training to verify your environment:

```bash
# 環境情報確認 / Check environment info
systeminfo | findstr /C:"OS Name" /C:"OS Version"
echo %PROCESSOR_ARCHITECTURE%

# 必須ツール確認 / Verify required tools
node -v && npm -v
git --version
python --version || echo "Python not installed"

# WSL2 が無効であることを確認（正常） / Verify WSL2 is disabled (expected)
wsl --version 2>&1 | findstr "not"
# "WSL is not installed" または "command not found" が出れば正常

# Docker が無いことを確認（正常） / Verify Docker is absent (expected)
docker --version 2>&1 | findstr "not"
# "command not found" が出れば正常
```

**期待される結果 / Expected Results**:
- ✅ Node.js: v20.x.x 以上
- ✅ Git: 動作する / Works
- ✅ Python: 3.10 以上（オプションBの場合）
- ❌ WSL: コマンドが見つからない / Command not found
- ❌ Docker: コマンドが見つからない / Command not found

---

## 10. 研修前チェックリスト / Pre-training Checklist

### 1週間前 / 1 Week Before

- [ ] GitHub アカウント作成・確認アンケート回答
- [ ] VS Code インストール
- [ ] Claude Code Extension インストール
- [ ] Node.js インストール（`node -v` 確認）
- [ ] Git インストール（`git --version` 確認）
- [ ] LLM アクセス確認（Bedrock または Anthropic API）

### 3日前 / 3 Days Before

- [ ] 研修用リポジトリへの招待承認
- [ ] `git clone` / `git push` 動作確認
- [ ] `npm install better-sqlite3` 動作確認
- [ ] Google Chrome インストール

### 前日 / 1 Day Before

- [ ] （オプション）データセット事前ダウンロード
- [ ] Claude Code で簡単なプロンプト実行確認
- [ ] MCP サーバー（filesystem等）接続確認

### 当日 / Day Of

- [ ] 環境全体のスモークテスト
- [ ] 不明点・つまずきポイントを講師に報告

---

## 10. よくある質問 / FAQ

### Q1: Docker は必須ですか？ / Is Docker required?

**A**: いいえ、必須ではありません。SQLite + better-sqlite3 を使用することで、Docker なしでローカル開発が可能です。Docker が使える環境の方は、オプションとして PostgreSQL を Docker Compose で起動することもできます。

**A**: No, Docker is NOT required. Using SQLite + better-sqlite3 enables local development without Docker. Participants who can run Docker may optionally use Docker Compose for PostgreSQL.

### Q2: Kaggle アカウントは必要ですか？ / Do I need a Kaggle account?

**A**: いいえ、不要です。すべてのデータセットは GitHub、archive.org、大学サイト等から直接ダウンロード可能です。

**A**: No, you don't. All datasets can be downloaded directly from GitHub, archive.org, university sites, etc.

### Q3: AWS の費用はどのくらいかかりますか？ / How much will AWS cost?

**A**: 研修期間中（12ヶ月以内）は AWS Free Tier 内で $0/月で運用可能です。LLM（Claude API/Bedrock）の従量課金のみ発生し、研修全体で数十ドル程度を想定しています。12ヶ月後も継続する場合、~$25-30/月のコストが発生します。

**A**: During the training period (within 12 months), you can operate within the AWS Free Tier for $0/month. Only LLM charges (Claude API/Bedrock) are pay-as-you-go, estimated at tens of dollars for the entire training. After 12 months, costs are ~$25-30/month if you continue.

### Q4: Mac と Windows で動作に差はありますか？ / Are there differences between Mac and Windows?

**A**: SQLite + better-sqlite3 を使用する限り、ほとんど差はありません。ネイティブモジュールのビルドが発生するため、Windows では Visual Studio Build Tools が必要になる場合がありますが、通常は自動でインストールされます。

**A**: Using SQLite + better-sqlite3, there are minimal differences. Native module compilation may require Visual Studio Build Tools on Windows, but these are typically installed automatically.

### Q5: 第2回以降の題材は選択できますか？ / Can I choose the application topic for Sessions 2-5?

**A**: はい、オプションAとオプションBから選択可能です。講師と相談の上、決定します。

**A**: Yes, you can choose between Option A and Option B. The decision will be made in consultation with the facilitator.

### Q6: AWS Workspaces（仮想化Windows）で本当に動作しますか？ / Will this really work on AWS Workspaces (virtualized Windows)?

**A**: はい、動作します。すべての推奨アプリケーションは以下の理由でAWS Workspacesで動作確認済みです:
- WSL2を一切使用しない
- Docker を一切使用しない
- すべてWindows ネイティブツール（Node.js、PostgreSQL installer、SQLite）のみ使用
- ネストされた仮想化を必要としない

**A**: Yes, it will work. All recommended applications are verified to work on AWS Workspaces because:
- No WSL2 whatsoever
- No Docker whatsoever
- Only Windows-native tools (Node.js, PostgreSQL installer, SQLite)
- No nested virtualization required

### Q7: WSL2 が使えない環境ですが、Redis は使えますか？ / Can I use Redis without WSL2?

**A**: はい、3つの選択肢があります:
1. **Windows版Redis** を使用: https://github.com/tporadowski/redis/releases (非公式だが動作実績あり)
2. **メモリキャッシュで代替**: Node.js/Python の in-memory キャッシュで代替（研修では十分）
3. **Redis を完全にスキップ**: 推奨アプリはすべてRedisなしでも動作可能

**推奨**: オプション2（メモリキャッシュで代替）が最もシンプル

**A**: Yes, you have 3 options:
1. **Windows Redis binary**: https://github.com/tporadowski/redis/releases (unofficial but proven)
2. **In-memory cache alternative**: Use Node.js/Python in-memory cache (sufficient for training)
3. **Skip Redis entirely**: All recommended apps work without Redis

**Recommended**: Option 2 (in-memory cache) is simplest

---

## 11. サポート・問い合わせ / Support & Contact

研修前の環境構築で困った場合:
- 研修用Slackチャンネル（事前に招待）で質問
- 講師への個別連絡（メールアドレス: TBD）

If you encounter issues during pre-training setup:
- Ask in the training Slack channel (invitation sent in advance)
- Contact the facilitator directly (email: TBD)

---

## 12. 参考資料 / Reference Materials

### 公式ドキュメント / Official Documentation
- Claude Code: https://docs.anthropic.com/claude-code
- Model Context Protocol (MCP): https://modelcontextprotocol.io/
- AWS Free Tier: https://aws.amazon.com/free/

### データセット / Datasets
- AMI Meeting Corpus: https://groups.inf.ed.ac.uk/ami/corpus/
- QMSum: https://github.com/Yale-LILY/QMSum
- JESC: https://nlp.stanford.edu/projects/jesc/
- JParaCrawl: http://www.kecl.ntt.co.jp/icl/lirg/jparacrawl/
- Chinook Database: https://github.com/lerocha/chinook-database

### SQL 学習リソース（初心者向け） / SQL Learning Resources (for beginners)
- SQLBolt: https://sqlbolt.com/
- W3Schools SQL Tutorial: https://www.w3schools.com/sql/

---

**最終更新 / Last Updated**: 2026-04-20
