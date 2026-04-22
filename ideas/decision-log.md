# 意思決定ログ / Decision Log

> このドキュメントは、研修コンテンツの方向性を決める過程で行った**議論の経緯**と**決定事項**を残す場所です。
> 未確定のまま残してよい項目や、後で方針が変わったときの取り消し線も許容します。
>
> This document captures the **discussion history** and **decisions** made while shaping the training content.
> It's fine to leave items open; when a direction is reversed later, mark the old decision with strikethrough rather than deleting it.

---

## 1. 現時点の決定事項サマリー / Current decisions (summary)

### 日本語

- **研修全体のフォーマット**: 5セッション構成（第1回 2h、第2〜5回 各4h、計18h）
- **ゴール**: 受講者が AI を活用した開発（AI駆動開発）を実務で実践できるようになる
- **アウトプット**: 模擬データに対して自然言語で総合的に回答できる AIエージェントアプリを、AIとのペア作業で構築し、AWS にデプロイできる
- **アウトカム**: AI とのペア作業を通じて知見のない新たな技術領域も AI の力で学びながらアプリを作り上げる経験を得て、AI の行動を設計・制御することで安全に開発できるという実感と自信を持つ
- **設計思想としてのストーリー**: 知る（S1）→ 壊す（S2）→ 設計する（S3）→ 作り込む（S4）→ 届ける（S5）
- **主題材**: 自然言語 → SQL → 可視化・洞察の対話型エージェントアプリ（Session 3–5 で段階的に構築）
  - 「総合的に回答」＝ エージェントが複数クエリを自律的に計画・実行・統合（例: 「セールスNo.1 の従業員と売上占有レコード種類」）
- **言語**: TypeScript（フロント・バック共通）
- **アーキテクチャ**:
  - フロント: React + Vite（S3 + CloudFront）
  - バック: AWS Lambda（Container Image）+ API Gateway（REST）
  - エージェント: Claude Agent SDK（公式 SDK）
  - DB 接続: MCP（構成A: Lambda 内 stdio 子プロセス）
  - DB（クラウド）: Amazon RDS for PostgreSQL + Chinook サンプルデータ
  - **DB（ローカル）: SQLite + `better-sqlite3` + Chinook SQLite 版**（Docker 必須にしない方針）
  - 会話履歴: Amazon DynamoDB（オンデマンド、TTL）
  - LLM: Amazon Bedrock Claude / Anthropic Claude API の両対応（環境変数で切替）
  - IaC: Terraform
  - ローカル開発: Node.js + SQLite のみ（Docker は optional な発展オプション）
- **完全無料枠を目指す**（LLM 従量課金のみ割り切り。研修全体で数十ドル規模想定）
- **受講者プロファイル**: エンジニアリング L2-3、AIツール L1-3 混在。セキュリティ観点への明示的な要望あり
- **受講者は技術詳細を理解する必要はない**: AI に生成させるため、アーキテクチャと技術要素の役割理解で OK
- **セキュリティは横串トピック・3層構造**:
  - 層1: AI の入出力の安全性（中核）
  - 層2: AI の行動ガードレール（中核。Permissions / Hooks / CLAUDE.md / Skills）
  - 層3: デプロイ環境（サブ。Terraform 雛形で実現済みを確認するレベル）
- **AI ガードレールの仕組み**: Permissions（中核・必ず効く）、Hooks（補強）、CLAUDE.md（補助・忘れられうる）、Skills（機能拡張）
- **Hooks は 3種類を段階的に登場**: S3 スターター内蔵（機密書き込み/危険コマンド）→ S4 受講者自作（秘密ファイル読み込み）→ S5 運用時（コミット時の機密チェック）
- **Skills は S2 で Review スキルを配布**、スターターテンプレートにもサンプル 1 つ内蔵
- **題材データの将来検討**: 現状 Chinook、将来は日本語化 or 仮想社内 CRM 自作を検討（ADR-007）
- **セッション間の接続**: 各回の末尾に次回への宿題をアナウンス
- **drawio 図**: [docs/architecture/reference-architecture.drawio](../docs/architecture/reference-architecture.drawio) / [docs/architecture/rds-infrastructure.drawio](../docs/architecture/rds-infrastructure.drawio)
- **Session 2 の再現性のある失敗**: 題材は経費精算（実装自由）、講師が追加機能リストを配布してデグレ体験、ペア相互評価で他人に触らせて失敗を発見
- **Session 5 の CI/CD**: 全員がついていける最低限ガイダンス + 余裕のある人への自由課題の二層構造
- **第3-5回の題材の割り当て（第3回=骨格、第4回=MCP実接続、第5回=クラウド化）は仮置き**、全体整理後に最終確定

### English

- **Overall training format**: 5 sessions (Session 1 is 2h, Sessions 2–5 are 4h each; 18h total)
- **Goal**: Participants become able to practice AI-driven development in their real work
- **Output**: Participants build an AI agent app that answers natural-language questions against simulated data in an integrated way, in pair-programming with AI, and deploy it on AWS
- **Outcome**: Through pair-programming with AI, participants gain the experience of building the app while learning unfamiliar technology domains with the help of AI, and develop a tangible sense and confidence that "safe development is possible by designing and controlling AI's behavior"
- **Design-thinking story**: Know (S1) → Break (S2) → Design (S3) → Build (S4) → Deliver (S5)
- **Main subject**: A conversational agent app for "natural language → SQL → visualization / insights" (built up gradually across Sessions 3–5)
  - "Integrated answer" = the agent autonomously plans, executes, and integrates multiple queries (e.g. "Who is the #1 salesperson and what record categories drive their sales?")
- **Language**: TypeScript (shared across frontend and backend)
- **Architecture**:
  - Frontend: React + Vite (S3 + CloudFront)
  - Backend: AWS Lambda (Container Image) + API Gateway (REST)
  - Agent: Claude Agent SDK (official)
  - DB access: MCP (configuration A: stdio child process inside Lambda)
  - DB (cloud): Amazon RDS for PostgreSQL + Chinook sample data
  - **DB (local): SQLite + `better-sqlite3` + the SQLite edition of Chinook** (Docker is not a hard requirement)
  - Conversation history: Amazon DynamoDB (on-demand, with TTL)
  - LLM: Amazon Bedrock Claude / Anthropic Claude API (dual support via env var)
  - IaC: Terraform
  - Local dev: Node.js + SQLite only (Docker is an optional stretch path)
- **Aim to stay within AWS free tier** (LLM usage is the accepted paid exception — expected to be on the order of tens of dollars total)
- **Participant profile**: Engineering L2-3, AI tools L1-3. Explicit request for security content.
- **Participants don't need deep tech details**: AI generates the code; understanding the roles of the architecture and the tech stack is enough
- **Security is cross-cutting with a 3-layer model**:
  - Layer 1: AI I/O safety (core)
  - Layer 2: AI behavior guardrails (core. Permissions / Hooks / CLAUDE.md / Skills)
  - Layer 3: Deployment environment (supporting. Confirm what's already implemented in the Terraform templates)
- **AI guardrail mechanisms**: Permissions (core, always enforced), Hooks (reinforcement), CLAUDE.md (supporting, can fade), Skills (capability extension)
- **Hooks introduced progressively in three phases**: S3 bundled in the starter (secret-write / dangerous-command block) → S4 participant-written (secret-file read warning) → S5 operational (post-commit secret scan)
- **Skills — in S2 a Review skill is distributed**; the starter template also ships with one sample Skill
- **Future consideration for the subject dataset**: currently Chinook; future options include Japanese localization or a fictional corporate CRM (ADR-007)
- **Inter-session handoff**: Announce the next session's homework at the end of each session
- **drawio diagrams**: [docs/architecture/reference-architecture.drawio](../docs/architecture/reference-architecture.drawio) / [docs/architecture/rds-infrastructure.drawio](../docs/architecture/rds-infrastructure.drawio)
- **Session 2 "reproducible failure"**: Subject is the expense app (free-form implementation); facilitator distributes an add-on features list to force a regression experience; peer review exposes failures the author can't spot alone
- **Session 5 CI/CD**: Two-tier — a minimum guided path everyone can follow + free-form stretch goals for those with bandwidth
- **Session assignment for 3-5 (tentatively: Session 3 = skeleton, Session 4 = real MCP, Session 5 = cloud)** is a placeholder; finalize after the overall layout settles

---

## 2. 議論の経緯タイムライン / Discussion timeline

### 日本語

#### 2026-04-19（初回セッション）

##### PR #1 レビュー開始

- Ken Yoneda が [PR #1](https://github.com/slalom-one/aidd-training-materials/pull/1) で Wide World Importers データベースを RDS for SQL Server にデプロイする Terraform コードを提出
- レビュー開始。Copilot レビュー済みコメントに加え、以下の重大な問題を確認:
  - RDS からS3 への到達性（NAT/VPC Endpoint 不足）
  - S3 バケット名長（63文字超過の可能性）
  - EC2 キーペア名の衝突
  - SSH 秘密鍵が Terraform state に平文保存
  - `rds_endpoint` output 形式の誤り
  - その他複数

##### ideas と PR の方向性を議論

- 現状の ideas/initial-ideas.md には SQL×AI 要素の記述なし
- 一方、Ken/Rodion/Tetsuya 間の議事録では「SQL Server + Wide World Importers を主題材」と合意
- → ideas と PR の方向性を整合させる必要がある
- **決定**: ideas に SQL×AI を正式に組み込む。ただし完成版ではなく、未完成のまま徐々に固めていく

##### 技術スタック検討

- 完全無料を目指す方針
- SQL Server は RDS 無料枠外、Wide World Importers も必須ではない → PostgreSQL + Chinook サンプルデータへ
- 対話形式が必要 → Lambda (ステートレス) + DynamoDB (会話履歴) で実現
- DB 接続は MCP 経由（構成A: stdio 子プロセス、研修の学習価値が高い）
- 言語は TypeScript
- LLM は Bedrock / Claude API 両対応（初期 AWS アカウントで Bedrock TPS=0 問題があるため）
- Lambda vs ECS 比較: 研修用途なら Lambda で十分（無料枠、短時間の対話応答）

##### セッション構成の整理

- 第1回: 統一テンプレートに再編、GitHub アカウント事前確認を明示化、MCP 概念紹介を追加
- 第2回: バイブコーディング。当初「講師が仕込んだロジック不良を炙り出す評価シナリオ」を検討したが、今のLLMはそのレベルのロジック不良は埋め込まない、という指摘で方針転換
- **決定**: Session 2 は「実装自由＋講師が追加機能リストで全員にデグレ体験」「Chrome 開発者ツールで他人のアプリを相互レビュー」に再設計
- Chrome は Session 2 の技術的前提、Session 1 末尾の宿題でアナウンス
- DevTools 使い方資料は「使う場面の直前」で配布（開発者ツール未経験者への配慮）
- セッション間の接続ルールを全体方針として追加

##### 共通方針・横串トピック

- **受講者プロファイルを明示**: スキル分布、セキュリティ観点への要望を ideas に記載
- **セキュリティは横串**: 単独セッションではなく、全セッションに埋め込む
- **Session 5 の CI/CD**: GitHub Actions 未経験者（L0）への配慮と、経験者（L2+）への発展課題の二層構造
- **Hooks / Skills / Rules**: 今後追加する要素として予告だけ入れる

##### アーキテクチャ図

- 当初、1枚目 `reference-architecture.drawio` をテキストボックスだらけで作成→ごちゃごちゃして不可読
- **決定**: AWS 公式アイコン（`mxgraph.aws4.*`）を使い、縦フロー、AZ省略、optional要素カットで書き直し
- User → CloudFront → (S3 + API Gateway) → Lambda → ... という正しい CloudFront ベースの配信フローに修正
- 2枚目 `rds-infrastructure.drawio` も同じ方針で刷新

##### Docker 前提の見直し（2026-04-20 追記、2026-04-21 前提更新）

- 当初の ideas はローカル開発を **Docker Compose (PostgreSQL + Chinook)** 前提にしていた
- しかし過去議論（Rodion Moiseev / Ken Yoneda 間）で、特定の Windows 環境（例: AWS Workspaces）で WSL2 / Docker Desktop のセットアップが困難であることが共有されていた
- **2026-04-21 前提更新**: 受講者 PC は**クライアント提供の Windows PC**が前提。Workspaces 等特定環境固有の検証は研修本体の必須項目ではなく、別 Issue（Optional / Stretch）で扱う
- 過去の暗黙合意は「Docker は必須にしない、使える人の optional な手段」
- **決定**: ローカルを **SQLite + `better-sqlite3`** に変更。Chinook は SQLite 版を配布。PostgreSQL はクラウド（Session 5）で使う
- Docker 経由の PostgreSQL 手順は発展オプションとして別資料に退避
- SQL 方言差は Chinook のクエリ範囲では軽微（日付関数など一部のみ）、MCP サーバー差し替えで吸収
- 詳細は ADR-006

#### 次回以降に決めたいこと（Open Questions）

- Session 3-5 の題材の具体的な割り当て（現状は仮置き）
- Session 2-5 の 4h 内時間配分の詳細
- LLM モデルは Claude Haiku / Sonnet どちらをデフォルトにするか
- 題材データの選択肢（日本語 Chinook / 仮想 CRM）の再検討タイミング（スターターテンプレート完成後）
- PR #1 の扱い（マージするか、PostgreSQL 版に書き換えるか、講師検証用として残すか）
- 各 Hook の実装詳細（S3 スターター内蔵、S4 受講者自作、S5 運用時）
- S2 で配布する Review スキルの具体内容

### English

#### 2026-04-19 (first working session)

##### PR #1 review started

- Ken Yoneda opened [PR #1](https://github.com/slalom-one/aidd-training-materials/pull/1), adding Terraform code to deploy the Wide World Importers database on RDS for SQL Server
- Review started. On top of the Copilot review comments, identified the following critical issues:
  - RDS-to-S3 reachability (no NAT/VPC Endpoint)
  - S3 bucket name length (may exceed 63 chars)
  - EC2 key pair name collision
  - SSH private key stored in plaintext in Terraform state
  - `rds_endpoint` output format bug
  - Several more

##### Reconciling ideas and PR direction

- `ideas/initial-ideas.md` had no mention of SQL×AI at that point
- Meanwhile the meeting notes between Ken / Rodion / Tetsuya agreed on "SQL Server + Wide World Importers as the main subject"
- → ideas and the PR direction need to be reconciled
- **Decision**: Formally incorporate SQL×AI into ideas, but not as a finished document — allow it to evolve

##### Tech stack exploration

- Aim for fully free-tier AWS
- SQL Server isn't on the RDS free tier, and Wide World Importers is not mandatory → switch to PostgreSQL + Chinook
- Conversational UX is required → achieve with Lambda (stateless) + DynamoDB (history)
- DB access via MCP (config A: stdio child process — high learning value)
- Language: TypeScript
- LLM: dual-support for Bedrock / Claude API (initial AWS accounts may have Bedrock TPS=0)
- Lambda vs ECS: Lambda is enough for training use (free tier, short conversational calls)

##### Session structure

- Session 1: re-laid out against the shared template; made GitHub-account pre-check explicit; added MCP concept intro
- Session 2: vibe coding. Initial idea was "facilitator plants logic bugs for participants to spot," but dropped — today's LLMs don't introduce that class of bug
- **Decision**: Session 2 is redesigned as "free-form implementation + facilitator-distributed add-on list forces regression experience + peer review through Chrome dev tools"
- Chrome is a technical prerequisite for Session 2, announced as homework at the end of Session 1
- DevTools usage doc is distributed "just before it's used" (care for participants with no DevTools experience)
- Added a general "inter-session handoff" rule

##### Cross-cutting policies

- **Document the participant profile**: skill distribution and the explicit security request belong in ideas
- **Security is cross-cutting**: not a standalone session, but embedded throughout
- **Session 5 CI/CD**: two-tier design for GHA newcomers (L0) and experienced participants (L2+)
- **Hooks / Skills / Rules**: previewed as elements to fold in later

##### Architecture diagrams

- First draft of `reference-architecture.drawio` used too many text boxes → became unreadable
- **Decision**: Rewrite using official AWS icons (`mxgraph.aws4.*`), vertical flow, drop AZ splits and optional elements
- Fixed the distribution flow to the correct CloudFront-based pattern: User → CloudFront → (S3 + API Gateway) → Lambda → ...
- Redid `rds-infrastructure.drawio` in the same spirit

##### Docker prerequisite revisited (added 2026-04-20, assumption updated 2026-04-21)

- Our first draft of `ideas` made local development depend on **Docker Compose (PostgreSQL + Chinook)**
- Earlier discussion (Rodion Moiseev / Ken Yoneda) had surfaced that WSL2 / Docker Desktop is difficult on specific Windows environments (e.g. AWS Workspaces)
- **Assumption updated 2026-04-21**: participant PCs are assumed to be **client-provided Windows PCs**. Environment-specific investigations (e.g. Workspaces) are tracked in a separate Optional / Stretch issue, not in the core training scope
- The implicit consensus was "Docker is not a hard requirement — it's an optional path for those who can use it"
- **Decision**: Local development switches to **SQLite + `better-sqlite3`**. Ship the SQLite edition of Chinook. PostgreSQL is used in the cloud (Session 5)
- PostgreSQL-via-Docker instructions are moved into a separate stretch-track doc
- SQL dialect differences are minor within Chinook's queries (mainly date functions); the MCP server swap hides the rest
- See ADR-006 for details

#### 2026-04-21

##### 全体像の批判的レビュー / Critical review of the overall direction

- 「アイディアはアイディアなので確定ではない」という指摘を受け、ideas 全体を批判的に再点検
- ゴール・ストーリー・題材・ガードレール構造・セキュリティ3層を論点として抽出
- 議論の上で以下を確定:
  - **アウトプット**（成果物）と**アウトカム**（受講者の変化）を分離して明文化
  - **設計思想としてのストーリー**（Session 1→5）を ideas に追記
  - **AI ガードレールの 4 仕組み**（Permissions / Hooks / CLAUDE.md / Skills）を体系化
  - **Permissions を中核**に据える（CLAUDE.md は補助、薄れる性質を明示）→ ADR-008
  - **Hooks は 3 種類を段階的に登場**（スターター内蔵 / 受講者自作 / 運用時）
  - **Skills は S2 で Review スキル配布**、スターターにもサンプル同梱
  - **セキュリティを 3 層構造化**（層1=AI I/O, 層2=ガードレール, 層3=AWS デプロイ）、層1+層2 が中核
  - **題材データは現状 Chinook、将来検討**（日本語化 or 仮想 CRM 自作） → ADR-007
- セッション別ファイル `ideas/sessions/session-{1..5}.md` を新設して、各セッションのタスク設計を深めていく方針

##### Critical review of the overall direction

- Triggered by the reminder that "ideas are ideas, not decisions," we critically re-inspected the whole document
- Surfaced the following as open questions: goal, story, subject, guardrail structure, security three layers
- After discussion, we settled:
  - Separated and wrote down **Output** (artifact) and **Outcome** (change in participants)
  - Added a **design-thinking story** (Session 1→5) to the ideas doc
  - Systematized the **four AI guardrail mechanisms** (Permissions / Hooks / CLAUDE.md / Skills)
  - **Permissions is the core** (CLAUDE.md is supporting — its "fading" property is made explicit) → ADR-008
  - **Hooks introduced progressively in three phases** (bundled in starter / participant-written / operational)
  - **Skills**: distribute a Review skill in S2, also bundle one sample in the starter
  - **Security organized into three layers** (Layer 1 = AI I/O, Layer 2 = guardrails, Layer 3 = AWS deploy); Layers 1 + 2 are the core
  - **Subject dataset stays on Chinook for now; revisit later** (Japanese localization or fictional CRM) → ADR-007
- We will create `ideas/sessions/session-{1..5}.md` and deepen per-session task design there

#### Open questions

- Concrete Session-3-5 subject assignment (tentative for now)
- Detailed 4h time breakdown for Sessions 2–5
- Default LLM model: Claude Haiku vs Sonnet
- When to revisit dataset options (Japanese Chinook / fictional CRM) — timed to post-starter-template
- What to do with PR #1 (merge? rewrite as PostgreSQL? keep as facilitator-only reference?)
- Implementation details of each Hook (S3 bundled, S4 participant-written, S5 operational)
- Content of the Review skill (S2 distribution)

---

## 3. 主要な意思決定（ADR 風） / Major decisions (ADR-style)

各決定について、**背景 / 検討した選択肢 / 決定 / 理由 / 影響** を残します。
For each decision, record **Context / Options considered / Decision / Rationale / Consequences**.

### ADR-001: 主題材を SQL Server から PostgreSQL + Chinook に変更 / Switch main subject DB from SQL Server to PostgreSQL + Chinook

#### 日本語

- **日付**: 2026-04-19
- **背景**: SQL Server は RDS 無料枠外（MySQL / PostgreSQL / MariaDB のみ）。Wide World Importers を使いたかった動機は「学習価値の高いサンプルデータ」にあり、SQL Server 自体は必須ではない
- **検討した選択肢**
  - (a) SQL Server のまま（月$15-30程度の受講者費用を割り切る）
  - (b) PostgreSQL + Pagila（DVD レンタル店データ）
  - (c) PostgreSQL + Chinook（音楽ストアデータ）
  - (d) Docker on EC2 で SQL Server（完全無料だが運用が重い）
- **決定**: (c) PostgreSQL + Chinook
- **理由**:
  - Chinook は PostgreSQL / MySQL / SQL Server 全対応のスキーマが公式にある → 将来差し替え可能
  - テーブル数 11、レコード数約 77,000 → 研修時間内に全体把握可能
  - 音楽ストアという題材は直感的で全員が理解しやすい
  - RDS 無料枠で完全無料
- **影響**:
  - PR #1 は SQL Server 前提なので、継続するなら PostgreSQL 版に書き換える必要あり（PR #1 の扱いは Open Question）
  - 研修資料に「SQL Server を使いたい場合は...」的な分岐を書く必要はない（ターゲットは PostgreSQL）

#### English

- **Date**: 2026-04-19
- **Context**: SQL Server isn't on the RDS free tier (only MySQL / PostgreSQL / MariaDB are). The original motivation for Wide World Importers was "a sample dataset with high learning value" — SQL Server itself isn't a hard requirement.
- **Options considered**
  - (a) Keep SQL Server (accept ~$15-30/month per participant)
  - (b) PostgreSQL + Pagila (DVD rental data)
  - (c) PostgreSQL + Chinook (music store data)
  - (d) Docker-hosted SQL Server on EC2 (nearly free but operationally heavy)
- **Decision**: (c) PostgreSQL + Chinook
- **Rationale**:
  - Chinook ships official schemas for PostgreSQL / MySQL / SQL Server → we can swap later if needed
  - 11 tables, ~77,000 records → comprehensible within the training time
  - Music-store domain is intuitive for everyone
  - Fully free under the RDS free tier
- **Consequences**:
  - PR #1 targets SQL Server. If we keep it, it needs to be rewritten for PostgreSQL (Open Question)
  - No need for a "if you want to use SQL Server..." branch in the materials (PostgreSQL is the target)

---

### ADR-002: エージェントは Lambda + MCP（構成A） / Agent runs as Lambda + MCP (configuration A)

#### 日本語

- **日付**: 2026-04-19
- **背景**: 対話型エージェントアプリを AWS 無料枠で実現する必要がある。DB 接続は MCP を使う（研修の学習価値のため）
- **検討した選択肢**
  - **構成A**: MCP サーバーを Lambda 内で stdio 子プロセスとして起動
  - **構成B**: MCP サーバーを別 Lambda / ECS でホスト（Streamable HTTP）
  - **構成C**: MCP を使わず、Agent SDK のカスタムツールで直接 SQL 実行
- **決定**: 構成A
- **理由**:
  - 研修教材として最もシンプル（Lambda 1つで完結）
  - MCP の学びが得られる（構成C は MCP 不在）
  - ローカル開発との一貫性（ローカルでも stdio 子プロセス起動で同じ）
  - コールドスタート数百 ms の悪化は研修用途で問題なし
- **影響**:
  - Lambda のコンテナイメージサイズが大きくなる（MCP サーバーバイナリ同梱）
  - 対話履歴は別途 DynamoDB で保持が必要（Lambda はステートレス）

#### English

- **Date**: 2026-04-19
- **Context**: Need a conversational agent app within the AWS free tier. DB access is via MCP (for training value).
- **Options considered**
  - **Configuration A**: Spawn the MCP server as a stdio child process inside the Lambda
  - **Configuration B**: Host the MCP server separately (another Lambda / ECS) over Streamable HTTP
  - **Configuration C**: Don't use MCP; run SQL through custom Agent SDK tools directly
- **Decision**: Configuration A
- **Rationale**:
  - Simplest as training material (one Lambda contains everything)
  - Preserves the MCP learning objective (C skips it)
  - Matches local development (same stdio-spawn pattern)
  - The few-hundred-ms cold-start overhead is acceptable for training
- **Consequences**:
  - Larger Lambda container image (bundles the MCP server binary)
  - Need DynamoDB for conversation history (Lambda is stateless)

---

### ADR-003: LLM は Bedrock と Claude API の両対応 / LLM supports both Bedrock and Claude API

#### 日本語

- **日付**: 2026-04-19
- **背景**: 初期契約の AWS アカウントでは Bedrock の TPS が 0 の場合があり、当日 Bedrock が使えない受講者が出る可能性がある
- **検討した選択肢**
  - (a) Anthropic Claude API のみ（APIキー1つで単純）
  - (b) Amazon Bedrock のみ（AWS IAM 統合、エンタープライズ文脈）
  - (c) 両対応（環境変数で切替）
- **決定**: (c) 両対応
- **理由**:
  - Bedrock TPS=0 問題への耐性
  - Slalom の実務文脈では Bedrock 経験の価値が高い
  - 環境変数による切替は実装コストが低い
- **影響**:
  - 環境変数スキームの設計が必要（`LLM_PROVIDER=bedrock|anthropic` など）
  - Bedrock 利用時の inference profile（`us.anthropic.*`）と region 設定を Findings に明記

#### English

- **Date**: 2026-04-19
- **Context**: Initial AWS accounts may have Bedrock TPS set to 0, meaning some participants wouldn't be able to use Bedrock on the day
- **Options considered**
  - (a) Anthropic Claude API only (simplest: one API key)
  - (b) Amazon Bedrock only (AWS IAM integration, enterprise context)
  - (c) Both supported via env-var switching
- **Decision**: (c) Both
- **Rationale**:
  - Robust against the Bedrock TPS=0 problem
  - In Slalom's real-world context, Bedrock experience is high-value
  - Env-var switching is cheap to implement
- **Consequences**:
  - Need an env-var scheme (e.g. `LLM_PROVIDER=bedrock|anthropic`)
  - Document Bedrock inference profile (`us.anthropic.*`) and region choices in Findings

---

### ADR-004: Session 2 は「実装自由＋追加機能リスト＋ペア相互評価」に再設計 / Session 2 is redesigned around "free implementation + add-on features list + peer review"

#### 日本語

- **日付**: 2026-04-19
- **背景**: Session 2 は「バイブコーディングの再現性のある失敗体験」を目的とする。当初案は「講師が仕込んだロジック不良を評価シナリオで炙り出す」だったが、今の LLM はそのレベルのロジック不良を作らない
- **検討した選択肢**
  - (a) お題を固定、評価シナリオで共通失敗を炙り出す → 今の LLM 前提では非現実的
  - (b) 実装自由、ペア相互評価で共通失敗を発見させる
  - (c) 段階的要件追加で全員が詰まる設計
- **決定**: (b) + (c) の組合せ。実装自由＋途中で追加機能リストを講師が配布＋ペア相互評価
- **理由**:
  - 実装自由にすることで、受講者のスキル・志向の違いに対応できる
  - 追加機能リストで全員が「修正によるデグレード」を体験（再現性の担保）
  - ペア相互評価により、自分では気づけない失敗（特にセキュリティ・UI 堅牢性）を体験
  - 受講者プロファイル（L2-3 混在、AIツール L1-3 混在）にフィットする
- **影響**:
  - 講師は追加機能リストと評価観点リストを事前準備
  - Chrome 開発者ツール使い方資料の準備（使う直前に配布）
  - Chrome インストールを Session 1 末尾の宿題として案内

#### English

- **Date**: 2026-04-19
- **Context**: Session 2 aims to deliver a "reproducible failure experience" with vibe coding. The original idea — "facilitator plants logic bugs and evaluation scenarios flush them out" — doesn't work because today's LLMs don't introduce that class of bug.
- **Options considered**
  - (a) Fixed subject, common evaluation scenarios expose common failures → unrealistic with modern LLMs
  - (b) Free implementation, peer review surfaces the common failures
  - (c) Staged requirement additions designed to make everyone get stuck
- **Decision**: Combine (b) and (c). Free-form implementation + facilitator distributes an add-on features list mid-session + peer review
- **Rationale**:
  - Free-form lets us adapt to the range of skills and preferences among participants
  - The add-on list guarantees everyone experiences "modification causes regression" (the reproducibility we want)
  - Peer review reveals failures participants cannot see in their own work (especially security, UI robustness)
  - Fits the participant profile (L2-3 engineering mix, L1-3 AI-tool experience mix)
- **Consequences**:
  - Facilitators must prepare the add-on list and the evaluation-criteria list
  - Prepare a Chrome DevTools usage doc (distributed just before use)
  - Announce "install Chrome" as homework at the end of Session 1

---

### ADR-005: セキュリティは横串トピックとして扱う / Security is handled as a cross-cutting topic

#### 日本語

- **日付**: 2026-04-19
- **背景**: 受講者アンケートで「Claude Code 利用時のセキュリティ上の注意と対策」を研修要素に入れてほしいとの明示要望あり
- **検討した選択肢**
  - (a) セキュリティ専用セッションを追加（既存5セッションを維持するなら時間枠確保が課題）
  - (b) 既存セッションにタッチポイントとして埋め込む
  - (c) (a) + (b) のハイブリッド
- **決定**: (b) 各セッションにタッチポイントを設ける
- **理由**:
  - セキュリティは「知識として教える」より「体験として身につける」が効く
  - 各セッションの題材に紐づけたほうが文脈が強い（例: Session 2 の DevTools 体験、Session 5 の IAM 最小権限）
  - 既存5セッション構成を維持できる
- **影響**:
  - 各セッションの記述に「セキュリティタッチポイント」項目を明示
  - Session 2 で DevTools でのペイロード改ざん・機密情報探索を必須アクティビティに

#### English

- **Date**: 2026-04-19
- **Context**: Participant survey explicitly asks for "security cautions and countermeasures when using Claude Code"
- **Options considered**
  - (a) Add a dedicated security session (scheduling pressure if we keep 5 sessions)
  - (b) Embed security as touch-points in existing sessions
  - (c) Hybrid: (a) + (b)
- **Decision**: (b) Touch-points in every session
- **Rationale**:
  - Security sticks better as experience than as lecture knowledge
  - Anchoring security to each session's subject gives it context (e.g. DevTools hands-on in Session 2, IAM least-privilege in Session 5)
  - Preserves the 5-session structure
- **Consequences**:
  - Each session explicitly lists "security touch-points"
  - In Session 2, payload tampering and secret-hunting in DevTools become mandatory activities

---

### ADR-006: ローカル DB は SQLite、Docker は optional な発展オプション / Local DB is SQLite; Docker is kept as an optional stretch path

#### 日本語

- **日付**: 2026-04-20
- **背景**:
  - 当初の ideas はローカル開発を Docker Compose + PostgreSQL 前提にしていた
  - しかし過去議論（Rodion Moiseev / Ken Yoneda 間）で、特定の Windows 環境（例: AWS Workspaces）での WSL2 / Docker Desktop の困難さ、および **Docker Desktop ライセンス配布のリードタイム** が明確な課題として共有されていた
  - 2026-04-21 前提: 受講者 PC はクライアント提供の Windows PC。Workspaces 等特定環境固有の検証は研修本体ではなく別 Issue（Optional / Stretch）で扱う
  - 過去の暗黙合意は「Docker は必須にしない、使える人の optional な手段」
- **検討した選択肢**
  - (a) Docker Compose + PostgreSQL のままで突破（Windows 受講者が詰むリスク）
  - (b) ローカル PostgreSQL を各自 OS に直接インストール（OS 差異が拡大）
  - (c) 最初からクラウド RDS を使う（AWS コスト発生、共有 or 各自で他の課題あり）
  - (d) **SQLite + `better-sqlite3`** をローカル DB に採用（Node.js の npm install のみで動く）
  - (e) GitHub Codespaces 等のクラウドサンドボックス（Claude Code 拡張との相性課題）
- **決定**: (d) SQLite + `better-sqlite3`
- **理由**:
  - Docker 不要 → クライアント提供 Windows 環境で WSL2 / Docker Desktop のセットアップ負荷を避けられる（Workspaces 等特定環境でも同様の利点）
  - `npm install` 一発で OS 問わず動作
  - Chinook は SQLite 版の公式スキーマがあり、データ内容は PostgreSQL 版と同等
  - 研修題材（Chinook に対する自然言語クエリ）で必要な機能は SQLite と PostgreSQL で実質的な差が出ない
  - MCP サーバーを差し替える設計にすれば、アプリコードは DB エンジンに依存しない
  - 第5回で PostgreSQL に切り替える経験自体が「抽象化の価値」の教材になる
- **影響**:
  - ローカル MCP は SQLite 用に差し替え（既存パッケージ or 自作）
  - アプリは環境変数で MCP 接続先を切り替え（ローカル = SQLite、クラウド = PostgreSQL）
  - Chinook の SQLite 版 `.db` ファイルを研修リポジトリに同梱 or 配布手順を整備
  - Docker 版手順は発展オプションとして別資料に退避（完全削除ではない）
  - SQL は共通サブセット（ANSI SQL 寄り）に寄せる方針をスターターテンプレートに反映
  - `better-sqlite3` はネイティブモジュールなので、Windows でのビルド可否を Findings で事前検証

#### English

- **Date**: 2026-04-20
- **Context**:
  - The initial draft of `ideas` assumed Docker Compose + PostgreSQL for local development
  - But earlier discussion (Rodion Moiseev / Ken Yoneda) had surfaced the difficulty of WSL2 / Docker Desktop on specific Windows environments (e.g. AWS Workspaces) and the **lead time for distributing Docker Desktop licenses**
  - Assumption updated 2026-04-21: participant PCs are client-provided Windows PCs; environment-specific checks (e.g. Workspaces) belong in a separate Optional / Stretch issue, not in the core training
  - The implicit consensus there: "Docker is not a hard requirement; it's an optional path for those who can use it"
- **Options considered**
  - (a) Stay on Docker Compose + PostgreSQL (risk: Windows participants get stuck)
  - (b) Install PostgreSQL natively on each OS (widens OS-specific divergence)
  - (c) Use a cloud RDS from the start (AWS cost; shared-vs-per-user issues)
  - (d) **SQLite + `better-sqlite3`** as the local DB (runs after a plain `npm install`)
  - (e) Cloud sandboxes like GitHub Codespaces (mismatch with the Claude Code extension)
- **Decision**: (d) SQLite + `better-sqlite3`
- **Rationale**:
  - No Docker needed → avoids WSL2 / Docker Desktop setup cost on client-provided Windows (including specific environments like Workspaces)
  - Just `npm install` and it runs on every OS
  - Chinook ships an official SQLite schema with the same data as the PostgreSQL edition
  - The functionality the training subject (natural-language queries over Chinook) needs does not differ meaningfully between SQLite and PostgreSQL
  - A swap of MCP server lets the app stay DB-engine-agnostic
  - Switching to PostgreSQL in Session 5 becomes a teaching moment for abstraction
- **Consequences**:
  - Local MCP becomes a SQLite variant (existing package or custom)
  - The app switches MCP endpoints by env var (local = SQLite, cloud = PostgreSQL)
  - Ship Chinook's SQLite `.db` in the training repo or provide a distribution procedure
  - Keep Docker steps around — but as a stretch-track doc, not the primary path
  - Starter templates pin SQL to a common subset (close to ANSI SQL)
  - `better-sqlite3` is a native module, so Findings must verify its build path on Windows

---

### ADR-007: 題材データは現状 Chinook、将来は日本語化 or 仮想 CRM を検討 / Subject dataset stays on Chinook for now; consider Japanese localization or fictional CRM later

#### 日本語

- **日付**: 2026-04-21
- **背景**:
  - 現在の題材は Chinook（英語の音楽ストアデータ）。SQLite 対応が公式配布されており、Docker 不要で使えるという**実装面の制約**から選ばれた
  - しかし受講者は日本人であり、**日本語データのほうが問いや結果を直感的に理解しやすい**
  - クライアント研修という位置づけでは、**業務実務に近いデータ**（社内 CRM 等）のほうが刺さる可能性がある
  - AI でスキーマもデータも生成可能という認識が講師陣で共有されている
- **検討した選択肢**
  - (a) Chinook のまま（準備コスト最小）
  - (b) Chinook の日本語化（スキーマは流用、アーティスト名・曲名等を日本のものに AI で生成）
  - (c) 仮想社内 CRM の自作（クライアント業務文脈にジャスト、AI でスキーマ+データ生成）
  - (d) Northwind 等の日本語化
- **決定**: 現時点では **(a) Chinook のまま** で進める。スターターテンプレートが動き出した後、Session 4 の題材詳細を詰めるタイミングで **(b) or (c) を再検討**する
- **理由**:
  - スターターテンプレートが動くこと、MCP 接続が回ること、Hook / Permissions が機能することのほうが**先に片付けるべき課題**
  - 題材データ変更はスキーマ互換性があれば後から差し替えやすい
  - 現時点で (b) / (c) に踏み込むと準備コストが嵩み、他の重要タスクを圧迫する
- **影響**:
  - Session 4 の題材詳細設計時に、(b) / (c) を再評価する TODO を残す
  - スターターテンプレートは Chinook 前提で作り始める
  - ただし **「題材データを差し替えやすい構造」** を最初から意識する（MCP サーバー、SQL、プロンプトが題材非依存に近い形）

#### English

- **Date**: 2026-04-21
- **Context**:
  - Current subject is Chinook (an English music-store dataset). Chosen primarily because it has an official SQLite edition that works without Docker — an **implementation constraint**
  - But participants are Japanese, and **Japanese data is more intuitive** for both the questions and the answers
  - For a client training, a dataset closer to **business reality** (e.g. an internal CRM) could resonate more
  - The facilitators agree that AI can generate both schema and data
- **Options considered**
  - (a) Stay on Chinook (lowest prep cost)
  - (b) Japanese-localized Chinook (reuse the schema, regenerate artist / track names in Japanese with AI)
  - (c) Build a fictional corporate CRM (perfectly fits the client's business context, AI generates schema + data)
  - (d) Localize Northwind or similar
- **Decision**: For now, **(a) Chinook**. Revisit **(b) or (c)** once the starter template is running and we're detailing the Session 4 subject
- **Rationale**:
  - Getting the starter template, MCP, Hooks, and Permissions working are **higher-priority problems**
  - As long as schema compatibility is kept, the dataset is easy to swap later
  - Diving into (b) / (c) now would squeeze out time from more critical tasks
- **Consequences**:
  - Leave a TODO to re-evaluate (b) / (c) when we finalize the Session 4 subject details
  - Start building the starter template on Chinook
  - Still, design deliberately so the dataset is **easy to swap** (the MCP server, SQL, and prompts stay as dataset-agnostic as possible)

---

### ADR-008: AI 行動ガードレールは Permissions を中核に据える / AI-behavior guardrails are Permissions-centered

#### 日本語

- **日付**: 2026-04-21
- **背景**:
  - AI の行動制御として「Permissions（settings.json）」と「CLAUDE.md（Memory）」の両方を扱うべく整理していた
  - しかし CLAUDE.md は**長い会話のうちに指示が薄れる**実態があり、命令としての強度が不十分
  - 一方 Permissions は **仕組みとして必ず効く**（Claude Code が実行前に機械的にチェック）ので、ガードレールとして最も信頼できる
- **検討した選択肢**
  - (a) Rules = CLAUDE.md + Permissions の複合として並列に扱う
  - (b) Permissions を中核、CLAUDE.md は補助として扱う（両者の性質差を受講者に明示）
  - (c) CLAUDE.md を中核、Permissions は補助として扱う
- **決定**: **(b) Permissions 中核、CLAUDE.md 補助**
- **理由**:
  - CLAUDE.md は命令として弱い（忘れられうる）ことを受講者が**実体験として学ぶ**価値がある
  - Permissions は settings.json で宣言的に書けて、Claude Code が強制する → 「仕組みとして効く」という体験を届けやすい
  - Hooks は Permissions を補強する位置付け（実行時検査・ブロック・記録）
  - Skills は機能拡張の別軸（ガードレールそのものではないが、研修で体験してもらう）
- **影響**:
  - スターターテンプレートには **Permissions / Hooks / CLAUDE.md / Skills** を全て含めるが、**Permissions を中核と明示**する教材とする
  - CLAUDE.md は「AI に知識を与える補助」として紹介し、「命令としては弱い」を明言する
  - Session 3-5 を通じて、Permissions が効く／効かないの境界を受講者に体験させる
  - 研修資料の呼称は「Permissions」を採用（日本語でも Permissions のまま）

#### English

- **Date**: 2026-04-21
- **Context**:
  - We were treating "Permissions (settings.json)" and "CLAUDE.md (Memory)" together as AI-behavior controls
  - However, CLAUDE.md **fades over long conversations** — its strength as a command mechanism is limited
  - Permissions, by contrast, is **mechanically enforced** (Claude Code checks before execution) — it is the most reliable guardrail
- **Options considered**
  - (a) Treat "Rules = CLAUDE.md + Permissions" as a composite, in parallel
  - (b) Make Permissions the core, CLAUDE.md a supporting mechanism (surface the gap to participants)
  - (c) Make CLAUDE.md the core, Permissions a supporting mechanism
- **Decision**: **(b) Permissions core, CLAUDE.md supporting**
- **Rationale**:
  - Participants benefit from **experiencing firsthand** that CLAUDE.md is weak as a command mechanism (can be forgotten)
  - Permissions is declarative in settings.json and enforced by Claude Code → easy to deliver as "a mechanism that actually works"
  - Hooks reinforce Permissions (runtime inspection, blocking, logging)
  - Skills are a different axis (capability extension, not a guardrail per se, but part of the training experience)
- **Consequences**:
  - The starter template includes **all four** (Permissions / Hooks / CLAUDE.md / Skills), but the training material **explicitly positions Permissions as the core**
  - CLAUDE.md is introduced as "a supporting way to give the AI knowledge," with the weakness stated plainly
  - Across Sessions 3-5, participants experience the boundary of what Permissions does and doesn't catch
  - The training materials use the term "Permissions" (kept as-is in Japanese too)

---

## 4. メモ・補足 / Notes

### 日本語

- この Decision Log は**完成版を作る場ではない**。未確定なら未確定のまま残す。方針が覆ったら元の決定を `~~取り消し線~~` で残す
- 主要な決定をしたときは、そのつどこのファイルに追記する
- ADR 風の記述は「後で見返して理由を辿れる」ことが目的。書き起こしコストが高い場合はタイムラインへの追記だけで OK

### English

- This Decision Log is **not meant to be a finished document**. Leave things open when they are open. If a decision is reversed, keep the old one with `~~strikethrough~~`.
- Append here whenever a meaningful decision is made
- The ADR-style entries exist to "let us trace the reasoning later." If writing one is too heavy, a timeline-only note is fine
