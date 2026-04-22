# Session 5: AI駆動開発実践③ 〜 プロトタイプのリリース

> **ステータス / Status**: 骨格作成中 / Skeleton in progress
> **関連 / Related**: [initial-ideas.md の Session 5 記述](../initial-ideas.md)、[decision-log.md](../decision-log.md)、[RDS インフラ図](../../docs/architecture/rds-infrastructure.drawio)
>
> このファイルは `ideas/initial-ideas.md` の Session 5 記述を起点に、「研修本番で受講者に届けるもの」から逆算して研修コンテンツ制作のためのタスク設計を行う場所。
> Starting from the Session 5 description in `ideas/initial-ideas.md`, this file reverse-engineers what we ship to participants into a concrete content-production task design.

---

## 1. このセッションで受講者に届けるもの（成果物）/ What we deliver to participants

### 事前（セッション前）/ Before the session

- [ ] **Session 4 末尾で配布済みの宿題アナウンス**: AWS アカウント準備と `aws sts get-caller-identity` 動作確認、AWS CLI / Terraform インストール
- [ ] **AWS アカウント準備手順書**: 新規アカウント作成、アクセスキー設定、`aws configure`
- [ ] **AWS CLI / Terraform インストール手順書**（OS 別）
- [ ] **Bedrock の region / inference profile 設定 Findings**: 研修前に講師で確認しておく
- [ ] **Bedrock TPS=0 対応の切替手順（Bedrock → Claude API）**: 当日トラブル時のリカバリ用

### 当日（セッション中）/ During the session

- [ ] **スライド（PPTX）**:
  - Session 5 のゴール提示
  - AWS インフラ構成図（RDS インフラ drawio）の説明
  - 技術スタック対比表（ローカル ↔ AWS クラウド）の「差し替わる行」を振り返る
  - Terraform で作るもの（Lambda / API Gateway / RDS / DynamoDB / Secrets Manager / CloudFront + S3 / IAM）
  - Lambda コンテナイメージの仕組み
  - CI/CD 二層構造の説明
    - 最低限ガイダンス（全員がやる `main` push → 自動デプロイ）
    - 発展課題（PR 時 plan、レイヤキャッシュ、ステージング→本番、Slack 通知、セキュリティスキャン等）
  - GitHub Actions の概念ミニ解説（ワークフロー／ジョブ／ステップ）
  - **運用時 Hook（Hook 4）の導入**: PostToolUse で `git commit` 後の機密情報スキャン
  - **Permissions のデプロイ前チェック活用**: `terraform destroy` 前の確認プロンプト等
  - **セキュリティ層3 はアーキテクチャ説明時の補足として扱う**: AWS インフラ構成図 / Terraform 雛形の walkthrough のなかで、IAM 最小権限・Secrets Manager・ログの扱いを一言ずつ添える（独立スライド・チェックリストは作らない）
  - `terraform destroy` の実行と確認
  - 事後アンケート実施
- [ ] **Terraform 雛形（Git リポジトリ）**: 受講者がクローンして使える
  - Lambda（Container Image）/ API Gateway / RDS PostgreSQL / DynamoDB / Secrets Manager / CloudFront + S3 / IAM
  - Bedrock / Claude API 切替用の環境変数スキーム
  - IAM 最小権限のロール定義
  - `terraform destroy` 時のクリーンアップ手順
- [ ] **GitHub Actions ワークフロー雛形**:
  - **最低限ガイダンス版**: `main` push で `terraform apply` + Lambda コンテナデプロイ
  - **発展課題用の断片**（別ファイル群として配布）: PR時 plan、キャッシュ、Slack 通知等
- [ ] **デプロイ手順ドキュメント（step-by-step）**: 講師が事前にドライラン済み
- [ ] **GitHub Actions 概念ミニ資料**（未経験者向け）
- [ ] **Hook 4（コミット時機密チェック）の仕様書 + リファレンス実装**
- [ ] **Permissions のデプロイ前チェック例**
- [ ] **事後アンケートフォーム**
- [ ] **発展課題リスト（事後参照）**: 研修後の自己学習ネタ
- [ ] **`terraform destroy` のチェックリスト**（課金を残さないため）
- [ ] **講師用進行台本**

### 事後（セッション後）/ After the session

- [ ] **次回への宿題**: なし（最終回）
- [ ] **研修後の自己学習ネタ発展課題リスト**: 受講者が持ち帰る
- [ ] **Session 5 振り返り資料**: 研修全体の学びの整理、事後アンケート結果の Before/After 比較
- [ ] **受講者各自のアプリ（クラウド版）**: CloudFront URL でアクセス可能（destroy 前）
- [ ] **受講者各自の GitHub Actions ワークフロー**: 動く自動デプロイ

---

## 2. 成果物から逆算したコンテンツ構造 / Content structure reverse-engineered from deliverables

### 座学パート / Lecture part
- (TBD) AWS インフラ構成図の読み方（RDS インフラ drawio）
- (TBD) Lambda コンテナイメージの仕組み
- (TBD) CI/CD 二層構造の考え方
- (TBD) セキュリティ層3 は独立解説せず、AWS インフラ構成図スライドの補足として口頭で触れる

### ハンズオンパート / Hands-on part
- (TBD) Terraform で AWS リソースを立ち上げる
- (TBD) Lambda に自作エージェントをデプロイ
- (TBD) CloudFront URL からアクセス確認
- (TBD) GitHub Actions 最低限ワークフローを動かす
- (TBD) Hook 4 を組み込む
- (TBD) `terraform destroy` でリソース削除

### 相互作用パート / Interaction part
- (TBD) 研修全体の学びを全員で共有する振り返り
- (TBD) 発展課題を「自分はこれをやる」と宣言する時間

### 振り返りパート / Retrospective part
- (TBD) 事後アンケートで Before/After 比較
- (TBD) 「研修が終わった後も自分で試せる」マインドセット醸成

---

## 3. 各コンテンツの「根拠」と「検証項目」/ Rationale and verification items

### 根拠 / Rationale
- Terraform 雛形: ideas 共通方針「デプロイ手順・IaC・CI/CD の雛形」を実装
- 二層構造 CI/CD: ideas Session 5「最低限ガイダンス + 発展課題」
- Hook 4（コミット時機密チェック）: Hooks/Skills/Permissions 組み込みマップ Session 5
- セキュリティ層3 の扱い: 3 層構造で層3 はサブ。独立スライド・チェックリストは作らず、アーキテクチャ説明時の補足にとどめる
- 事後アンケート + Before/After: Session 1 の事前アンケート設計と対

### 検証項目 / Verification
- (TBD) 講師陣で Session 5 を通しでドライラン（デプロイ成功、destroy 成功）
- (TBD) Bedrock TPS=0 の受講者が Claude API に切り替えてデプロイできるか
- (TBD) IAM 最小権限でアプリが動くか（Lambda 実行ロール、CI/CD ロール両方）
- (TBD) GitHub Actions 未経験者（L0）が最低限ガイダンスで動くか
- (TBD) `terraform destroy` で全リソースが削除されるか（残存課金がないか）
- (TBD) 4h の時間配分が現実的か（特にデプロイに時間がかかる可能性）

---

## 4. 制作タスク一覧 / Production task list

### スライド作成 / Slides
- [ ] (TBD) Session 5 全体スライド
- [ ] (TBD) AWS インフラ構成図スライド
- [ ] (TBD) CI/CD 二層構造スライド
- [ ] (TBD) GitHub Actions 概念スライド
- [ ] (TBD) Hook 4 導入スライド
- ~~セキュリティ層3 軽めスライド~~ → 作らない。AWS インフラ構成図スライドの補足として口頭で扱う

### コード資産 / Code assets
- [ ] (TBD) Terraform 雛形の作成（Lambda / API GW / RDS / DynamoDB / Secrets / CloudFront + S3 / IAM）
  - PR #1 の SQL Server 版を PostgreSQL 版に書き直すか、新規作成するかの判断含む
- [ ] (TBD) GitHub Actions 最低限ワークフローの作成
- [ ] (TBD) GitHub Actions 発展課題用ワークフロー断片集
- [ ] (TBD) Hook 4（コミット時機密チェック）のリファレンス実装
- [ ] (TBD) Bedrock / Claude API 切替の環境変数スキーム実装

### 配布物作成 / Handouts
- [ ] (TBD) AWS アカウント準備手順書
- [ ] (TBD) AWS CLI / Terraform インストール手順書
- [ ] (TBD) デプロイ step-by-step ドキュメント
- [ ] (TBD) GitHub Actions 概念ミニ資料
- [ ] (TBD) Hook 4 仕様書
- ~~セキュリティ層3 チェックリスト~~ → 作らない（アーキテクチャ説明時の口頭補足に統合）
- [ ] (TBD) `terraform destroy` チェックリスト
- [ ] (TBD) 発展課題リスト

### 運営物 / Operations
- [ ] (TBD) Bedrock TPS=0 対応の当日フォロー手順
- [ ] (TBD) 事後アンケートフォーム
- [ ] (TBD) 研修全体振り返り資料（Before/After 比較）
- [ ] (TBD) 講師用進行台本

### 検証 / Verification
- [ ] (TBD) 講師陣で Terraform デプロイのドライラン
- [ ] (TBD) `terraform destroy` で完全削除できるかの確認
- [ ] (TBD) GitHub Actions 最低限ワークフローが動くかの確認
- [ ] (TBD) Bedrock / Claude API 両方で動作確認
- [ ] (TBD) IAM 最小権限で本当に動くかの確認
- [ ] (TBD) 4h で通しで回るかの時間測定

---

## 5. Open Questions / TBD

- PR #1 の Terraform を PostgreSQL 版に書き換えるか、新規作成するか
- RDS を受講者ごとに立てるか、共有するか（立てると 10-20 分かかるので共有の方が時間効率的）
- CloudFront URL を一時的な共有用に十分か（HTTPS 証明書の扱い）
- Bedrock を使わない受講者向けの Claude API キーを研修用に用意するか、受講者自身で取得するか
- `terraform destroy` をセッション内で絶対やらせるか、受講者に任せるか（後者だと課金残存リスク）
- GitHub Actions 未経験者のフォローをどこまで手厚くするか
- 4h の時間配分（デプロイ 90 分 + CI/CD 60 分 + セキュリティ 30 分 + 発展 30 分 + 振り返り 30 分 = 240 分 が目安だがキツい）
- 発展課題として Hooks / Skills / Permissions の「さらに応用」を入れるか
