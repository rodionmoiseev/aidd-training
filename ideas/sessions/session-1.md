# Session 1: AI駆動開発トレーニング環境のセットアップ / AI駆動開発概要

> **ステータス / Status**: 骨格作成中 / Skeleton in progress
> **関連 / Related**: [initial-ideas.md の Session 1 記述](../initial-ideas.md)、[decision-log.md](../decision-log.md)
>
> このファイルは `ideas/initial-ideas.md` の Session 1 記述を起点に、「研修本番で受講者に届けるもの」から逆算して研修コンテンツ制作のためのタスク設計を行う場所。
> Starting from the Session 1 description in `ideas/initial-ideas.md`, this file reverse-engineers what we ship to participants into a concrete content-production task design.

---

## 1. このセッションで受講者に届けるもの（成果物）/ What we deliver to participants

### 事前（セッション前）/ Before the session

- [ ] **研修案内メール**: 日時・ゴール・持ち物・事前準備の概要（研修1-2週間前）
- [ ] **GitHub アカウント事前確認アンケート**: アカウント所持状況の把握（研修1週間前）
- [ ] **GitHub アカウント作成手順ドキュメント**: 未所持者向け（アカウント確認アンケートに添付）
- [ ] **事前インストール手順書**: VS Code / Claude Code 拡張機能 / Claude Code 本体 / Node.js
  - **Windows 中心**（受講者はクライアント提供 Windows PC を使う前提）。Mac は参考情報として併記
  - Windows + AWS Workspaces 等の特定環境調査は別 Issue（Optional / Stretch）で扱い、本手順書には組み込まない
- [ ] **事前アンケート**（研修期待値・スキルレベル）: Session 1 冒頭で実施するが、内容は事前公開しておくと丁寧

### 当日（セッション中）/ During the session

- [ ] **スライド（PPTX）**:
  - 研修全体の流れ（5セッション構成の説明）
  - AI駆動開発の概要（座学）
  - バイブコーディング / プロトタイピング / プロダクション開発の使い分け
  - 主要ツール概観（Claude Code 中心）
  - **セキュリティの章（AIコーディング基本編 / 層1、受講者要望反映）**:
    - プロンプトインジェクション（外部ソースの指示に LLM が従ってしまうリスクの概念と簡単な例）
    - **機密情報をプロンプトに入れない**（API キー・個人情報・顧客データ等を生チャットで渡さない）
    - **`.gitignore` と `.env` の基本**（シークレットをコミットに混ぜない、既存リポジトリに入っていないかを確認する）
    - 生成コードの鵜呑み禁止（第2回で体験する失敗への伏線）
    - ツール権限の考え方（MCP サーバーが何にアクセスできるかは自分で決める）
    - **実際に起きた AIコーディング関連インシデント事例（2023-2025）**: 「自分もやりかねない」と腹落ちさせるための 3-5 分の事例紹介コーナー。各事例は「何が起きたか → 構造的な原因 → 今日の受講者が持ち帰る教訓」の 3 行で扱う。詳細は [ideas/sessions/session-1-security-incidents.md](./session-1-security-incidents.md) に集約。
      - **Replit AI の本番 DB 削除事件（2025/7）**: 「コードフリーズ中」と明示しても破壊的コマンドが走った → **自然言語の「慎重に」は制約にならない。権限で止める**
      - **Amazon Q Developer 拡張へのワイパー命令混入（2025/7）**: 外部 PR 経由でエージェントのシステムプロンプトが汚染 → **AI が読む指示ファイルはコード以上にセンシティブ**
      - **GitHub Copilot / VS Code の auto-approve 化（CVE-2025-53773）**: 外部入力から設定ファイルを書き換えさせて全ツール承認 → **「YOLO モード」化は人間が明示 ON するまで到達不可に**
      - **M365 Copilot "EchoLeak"（CVE-2025-32711, 2025/6）**: メール一通で RAG 経由ゼロクリック情報窃取 → **AI が取り込む外部データは「実行される命令」とみなして設計**
      - **Claude Code 内部ソース / システムプロンプト流出（2025/12）**: source map 混入で公開パッケージに含まれた → **publish 前に `npm pack --dry-run` 等で中身を必ず検査**
      - （Bonus 候補、時間があれば）Samsung × ChatGPT 情報漏洩（2023/3）、Supabase × Cursor SQL インジェクション経由トークン漏洩
    - 「ここは軽く概念紹介、体験と対策は Session 2-5 で順に深める」ことを明示
  - **研修運用上の注意事項（セッション冒頭で必ず伝える）**:
    - **Claude Code のトークン制限（usage limit）に当たった場合の対応**: 当日の残り時間は以下のいずれかに切り替えてOK
      - 他の受講者の PC に入ってペアプログラミングを行う
      - 他の受講者の AI 成果物をレビューする側に回る（Session 2 の評価観点を先取りしても良い）
      - 研修後に改めて続きの作業を行う（宿題は任意、当日追いつかなくても問題ない）
    - **代替 AI コーディングツールの利用可否**: 各自が会社契約・個人契約で **GitHub Copilot / Cursor / Codex など他の AI コーディングツール**を使える状態なら、それらに切り替えて進めてもOK（ただし手順書・スライドは Claude Code ベース。挙動差は各自で読み替え）
    - 狙い: 「Claude Code で詰まった = 今日は何もできない」にしない。研修の主題は AI 駆動開発の考え方とガードレールであり、特定ツールへのロックインではない
  - AI ガードレールの 4 つの仕組み紹介（Permissions / Hooks / CLAUDE.md / Skills）
  - MCP の概念（LLM と外部ツール・データソースをつなぐ標準プロトコル）
- [ ] **環境セットアップ手順書（当日版）**: スライドに沿って手を動かすためのMarkdown
- [ ] **MCP ハンズオン手順書**: 既存 MCP サーバー（filesystem, github 等）を Claude Code で使ってみる
- [ ] **事前アンケートフォーム**（冒頭で配布）
- [ ] **講師用進行台本**: タイムキーピング、想定問答集、ハマりポイントでの対応

### 事後（セッション後）/ After the session

- [ ] **次回への宿題アナウンス**: Google Chrome のインストール、経費精算アプリのイメージ考案（任意）
- [ ] **Session 1 振り返り資料**（事後参照用）: 今日やったこと、次回予告
- [ ] **Findings メモへの追記**（運営側）: 当日判明した OS 差異、つまずきポイント等

---

## 2. 成果物から逆算したコンテンツ構造 / Content structure reverse-engineered from deliverables

> ここは今後深めるセクション。座学・ハンズオン・相互作用・振り返りの各パートの中身を詰める。
> To be deepened later. Flesh out the lecture / hands-on / interaction / retrospective parts.

### 座学パート / Lecture part
- (TBD) 各スライドのメッセージと遷移
- (TBD) 「AI駆動開発って何？」に1スライドで答える絵／フレーズ
- (TBD) セキュリティの入口で伝える 4 つのガードレール仕組みの覚え方

### ハンズオンパート / Hands-on part
- (TBD) 環境セットアップの手順書に沿って進める
- (TBD) つまずきポイントの予測とリカバリ手順
- (TBD) MCP ハンズオンで触らせる既存 MCP サーバーの選定（filesystem / github / その他）

### 相互作用パート / Interaction part
- (TBD) 事前アンケートをどう使って受講者同士の紹介に繋げるか
- (TBD) 「自分のスキルレベル」を安心して開示できる雰囲気作り

### 振り返りパート / Retrospective part
- (TBD) 今日の体験を一言で表現する時間
- (TBD) 次回への期待を言語化させる

---

## 3. 各コンテンツの「根拠」と「検証項目」/ Rationale and verification items

> コンテンツごとに「なぜ入れるか」「作成時に何を検証するか」を明示する。
> For each content piece, make explicit why it's included and what to verify during creation.

### 根拠 / Rationale
- (TBD) 各コンテンツが ideas のどの記述から来ているか（ゴール・アウトカム・設計思想・受講者プロファイルとの紐付け）

### 検証項目 / Verification
- (TBD) 座学スライドが 30 分に収まるか
- (TBD) ハンズオン手順書通りに講師が動いて 45 分以内に終わるか（一般的な Windows / Mac のクライアント提供 PC で検証）
- (TBD) 事前アンケートが 15 分で回収できるか

---

## 4. 制作タスク一覧 / Production task list

> 粒度は中（各タスク半日〜数日で完結）を目安に。誰が向いているか／依存関係／受け入れ条件を明示。
> Target task granularity: medium (half a day to a few days each). Note likely owners, dependencies, and acceptance criteria.

### スライド作成 / Slides
- [ ] (TBD) 研修全体の流れスライド
- [ ] (TBD) AI駆動開発の概要スライド
- [ ] (TBD) セキュリティの章スライド（AIコーディング基本編）
  - プロンプトインジェクションの概要と簡単な例
  - 機密情報をプロンプトに入れない（APIキー / 個人情報 / 顧客データ）
  - `.gitignore` / `.env` によるシークレット管理の基本
  - 生成コードの鵜呑み禁止（Session 2 への伏線）
  - ツール権限の考え方（Session 3 以降への伏線）
  - **実際のインシデント事例スライド（3-5件）**: Replit DB削除 / Amazon Q ワイパー混入 / Copilot auto-approve 化 / M365 EchoLeak / Claude Code ソースリーク
- [ ] (TBD) **研修運用注意事項スライド**
  - Claude Code トークン制限時の切替（ペア PC / 他者成果物レビュー / 研修後に続き）
  - 代替 AI コーディングツール（Copilot / Cursor / Codex 等）使用可の明示
- [ ] (TBD) AI ガードレール 4 仕組み紹介スライド
- [ ] (TBD) MCP 概念スライド

### 手順書作成 / Runbooks
- [ ] (TBD) 事前インストール手順書（OS別）
- [ ] (TBD) 環境セットアップ当日版手順書
- [ ] (TBD) MCP ハンズオン手順書

### アンケート / Surveys
- [ ] (TBD) GitHub アカウント事前確認アンケート設計
- [ ] (TBD) 事前アンケート設計（期待値・スキルレベル）

### 運営物 / Operations
- [ ] (TBD) 研修案内メールテンプレート
- [ ] (TBD) 講師用進行台本
- [ ] (TBD) 研修用プライベート GitHub リポジトリの雛形

### Findings 整理 / Findings
- [ ] (TBD) OS 差異（Windows / Mac）のつまずきポイント
- [ ] (TBD) `better-sqlite3` の Windows ビルド検証（Session 3 以降の前準備だが Session 1 でインストール確認する）
- [ ] (TBD) LLM 接続方針（Bedrock / Claude API）の決定と Findings 化

---

## 5. Open Questions / TBD

- 事前アンケートの具体的な質問項目（自由記述 vs 選択式、項目数）
- GitHub アカウント未所持者が当日まだ作れていなかった場合のリカバリ手順
- MCP ハンズオンでどの既存 MCP サーバーを触らせるか（filesystem が無難だが、github も業務感があって魅力）
- セキュリティ留意点と AI ガードレール 4 仕組み紹介をどのくらいの時間で扱うか（概念紹介なのでまずは 10-15 分想定）
- 2 時間の配分が本当に妥当か（特に環境セットアップ 45 分で全員揃うか、当日講師のリハーサルで測定したい）
