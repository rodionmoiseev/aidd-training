# 初期アイデア / Initial Ideas

> **ステータス / Status**: 整理途中。各セッションは統一テンプレートで書いているが、`TBD` の項目が多い。
> Hooks / Skills / Permissions の研修への組み込み設計は固まったが、セッション別の詳細はこれから詰める。
> 検討経緯と決定事項は [ideas/decision-log.md](./decision-log.md) に記録。
> 各セッションの詳細タスク設計は [ideas/sessions/](./sessions/) に（作成予定）。
>
> Work in progress. Sessions are laid out using a shared template but many `TBD` items remain.
> Integration design for Hooks / Skills / Permissions into the training is settled; per-session details are still being fleshed out.
> The decision log and discussion history live in [ideas/decision-log.md](./decision-log.md).
> Per-session task design lives in [ideas/sessions/](./sessions/) (to be created).

## 研修全体のゴールとアウトカム / Overall goal and outcomes

### 日本語

#### ゴール（研修が目指す到達点） / Goal

> 受講者が**AI を活用した開発（AI駆動開発）を実務で実践できる**ようになる。

#### アウトプット（研修終了時点の成果物） / Output

> 模擬データに対して自然言語で総合的に回答できる **AIエージェントアプリ**を、**AIとのペア作業で構築し、AWS にデプロイできる**。

#### アウトカム（受講者にもたらされる変化） / Outcome

> AI とのペア作業を通じて**知見のない新たな技術領域も AI の力で学びながらアプリを作り上げる経験**を得て、**AI の行動を設計・制御することで安全に開発できる**という**実感と自信**を持つ。

#### ゴール・アウトプット・アウトカムの関係

- **ゴール**は「研修が目指す到達点」。受講者が AI 駆動開発を実務で実践できるようになること
- **アウトプット**は「研修で作るもの」。ゴール到達を示す具体的な成果物で、検証しやすい
- **アウトカム**は「研修で受講者に起きる変化」。マインドセットと自信の獲得を含む
- 研修の成否は**アウトカムで判断する**。アウトプットが完成しても、受講者が「自分で学びながら安全に AI 開発できる」という自信を持たなければ失敗

### English

#### Goal (what the training aims to achieve)

> Participants become able to **practice AI-driven development in their real work**.

#### Output (what participants will have at the end of the training)

> An **AI agent application** that answers natural-language questions against simulated data in an integrated way, **built in pair-programming with AI and deployed on AWS**.

#### Outcome (the change the training creates in participants)

> Through pair-programming with AI, participants gain the experience of **building the app while learning unfamiliar technology domains with the help of AI**, and develop a **tangible sense and confidence that "safe development is possible by designing and controlling AI's behavior"**.

#### How goal, output, and outcome relate

- **Goal** is where the training aims to take participants — being able to practice AI-driven development on the job
- **Output** is the artifact produced during the training — concrete and verifiable evidence of reaching the goal
- **Outcome** is the change inside the participants — including mindset shifts and confidence
- **Success is judged by the outcome.** If participants finish the app but don't come out feeling "I can learn unfamiliar tech with AI's help and develop safely," the training has failed

## 設計思想としてのストーリー / Design-thinking story (how Sessions 1-5 build on each other)

我々（講師陣）が研修を設計する際に頭の中で持っておくべき Session 1 から 5 のストーリー。受講者向けには各セッションのテーマ（エージェントアプリ開発の物語）として届ける。

The internal story we (the facilitators) keep in mind while designing the training. To participants this is delivered as each session's theme — the narrative of building an agent app.

### 日本語

**全体像**: 5回で「**知る → 壊す → 設計する → 作り込む → 届ける**」

| Session | キャッチコピー（設計意図） | 受講者体験の物語 |
|---------|-------------------------|----------------|
| **Session 1** | **知る**（AIとツールの関係） | AI駆動開発とは何か、MCP とは何かを知る。Claude Code が動き、既存の MCP サーバーで「AI がツールを使う」様子を目撃する |
| **Session 2** | **壊す**（AI任せの危うさ + AIでAIを助ける） | バイブコーディングで経費精算アプリを作り、相互レビューで「動いて見えても壊れている」を体験。Skills 配布で「AI を使って AI のコードをレビュー」も体験 |
| **Session 3** | **設計する**（スターター + Permissions + 骨格） | スターターテンプレート（Permissions / Hooks / Skills / CLAUDE.md が最初から入っている）を起点に、エージェントアプリの骨格を組む。**Permissions が効く**のを体感 |
| **Session 4** | **作り込む**（複数クエリ統合 + Hooks 自作） | 模擬データに MCP 実接続。複数クエリが必要な問い（例: 「セールスNo.1 の従業員と売上占有レコード種類」）にエージェントが自律的に答える様子を目撃。自分で Hook を書くハンズオン |
| **Session 5** | **届ける**（デプロイ + セキュリティ + CI/CD） | AWS にデプロイして URL で共有。IaC と CI/CD の雛形で「安全に届ける」全体像を持ち帰る |

**貫くメッセージ**: AI を使いながら学び、AI を制御し、AI と作り上げる — この3つの姿勢を身につける。

### English

**Whole arc**: five sessions of "**Know → Break → Design → Build → Deliver**"

| Session | Headline (design intent) | Participant-facing narrative |
|---------|--------------------------|------------------------------|
| **Session 1** | **Know** (the relationship between AI and tools) | Understand AI-driven development and MCP. See Claude Code run and watch "an AI using tools" through existing MCP servers |
| **Session 2** | **Break** (the danger of leaving it all to AI + using AI to help AI) | Vibe-code an expense app, experience "it looks working but it's broken" through peer review. A Skill is distributed to let you use AI to review AI-generated code |
| **Session 3** | **Design** (starter + Permissions + skeleton) | Start from a starter template (Permissions / Hooks / Skills / CLAUDE.md pre-wired) and build the agent skeleton. Feel **Permissions in action** |
| **Session 4** | **Build** (multi-query integration + writing your own Hook) | Connect MCP to simulated data. Watch the agent autonomously break a question like "Who is the #1 salesperson and what record categories drive their sales?" into multiple queries. Hands-on: write your own Hook |
| **Session 5** | **Deliver** (deploy + security + CI/CD) | Deploy to AWS, share via URL. Take away a whole-picture sense of "safe delivery" through IaC + CI/CD templates |

**Through-line message**: Learn while using AI, control AI, build with AI — internalize these three stances.

## AI ガードレールの構造 / AI guardrail structure

研修では「AI の行動を制御する 4つの仕組み」を扱う。中核は **Permissions**、補強が **Hooks**、補助が **CLAUDE.md**、機能拡張が **Skills**。

The training covers **four mechanisms for controlling AI behavior.** **Permissions** is the core, **Hooks** reinforces it, **CLAUDE.md** is a supporting mechanism, and **Skills** extends capabilities.

### 日本語

| 仕組み | 位置付け | 特徴 | 研修での扱い |
|-------|---------|------|-------------|
| **Permissions** | **中核** | `settings.json` に書く allow/deny ルール。**仕組みとして必ず効く**（Claude Code が実行前に機械的にチェック） | スターターテンプレートに最初から含める。Session 3 で「Permissions が効く」を体感 |
| **Hooks** | **補強** | ツール呼び出しの前後で走るシェルコマンド。**実行時に検査・ブロック・記録**できる | 3種類を段階的に登場させる（後述のマップ参照） |
| **CLAUDE.md（Memory）** | **補助** | AI に読ませる知識・指示。**ただしセッション中に薄れる**（長い会話で前段の指示が忘れられる）ため、命令としては弱い | 補助的な情報伝達として紹介。命令としての限界も明示 |
| **Skills** | **機能拡張** | 再利用可能な手順・ツールを Claude Code に登録 | Session 2 で「Review スキル」を配布して効果を実感させる。スターターテンプレートにサンプル 1つを同梱 |

**重要**: **Permissions は「必ず効く」が CLAUDE.md は「忘れられうる」**。この違いを受講者に明示することが、ガードレール設計の学びの核心。

### English

| Mechanism | Position | Characteristics | How we treat it in the training |
|-----------|----------|-----------------|---------------------------------|
| **Permissions** | **Core** | Allow/deny rules in `settings.json`. **Mechanically enforced** (Claude Code checks before executing) | Baked into the starter template. Session 3 is where participants feel "Permissions actually work" |
| **Hooks** | **Reinforcement** | Shell commands run before/after tool calls. Can **inspect, block, or log at runtime** | Three Hooks introduced progressively (see the mapping below) |
| **CLAUDE.md (Memory)** | **Supporting** | Knowledge / instructions for the AI to read. **But fades mid-session** (earlier instructions are forgotten over long conversations), so it's weak as a command mechanism | Introduced as supplementary information. We explicitly surface its limits as a command mechanism |
| **Skills** | **Capability extension** | Reusable procedures / tools registered with Claude Code | In Session 2 a "Review skill" is handed out so participants feel the effect. A sample Skill is included in the starter template |

**Key point**: **Permissions "always work," but CLAUDE.md "can be forgotten."** Making this contrast explicit to participants is the heart of guardrail-design learning.

## Hooks / Skills / Permissions の研修組み込みマップ / How Hooks / Skills / Permissions map onto the sessions

### 日本語

| Session | Permissions | Hooks | Skills | CLAUDE.md |
|---------|-------------|-------|--------|-----------|
| 1 | （紹介のみ） | （紹介のみ） | （紹介のみ） | （紹介のみ） |
| 2 | — | — | **Review スキル配布**: バイブコーディングしたコードを AI でレビューさせる | — |
| 3 | **スターター内蔵**: allow/deny が設定済み。受講者はこれを読み、試しに禁止操作をやって「効く」のを体験 | **スターター内蔵 Hook 2種**: ① 機密情報（`sk-`, `AKIA-` 等）の書き込みブロック ② 危険コマンド（`rm -rf /`, `curl \| sh`, `sudo` 等）のブロック | スターター内蔵の Skill サンプル（Session 2 の Review スキル同等品） | スターターに同梱、AI に知識を与える役割として紹介。ただし命令としては弱いことを明示 |
| 4 | Permissions を自分で追記する体験（DB 破壊クエリを allow/deny で制限など） | **受講者が自分で書く Hook**: `.env` や秘密ファイルの読み込み警告 Hook を実装・動作確認 | （発展）カスタム Skill 自作 | 題材に合わせて CLAUDE.md を拡張 |
| 5 | デプロイ前チェックの Permissions 活用 | **運用時の Hook**: コミット前の機密情報チェック Hook（PostToolUse で `git commit` 後に差分スキャン） | — | 運用ノウハウを CLAUDE.md に蓄積する発想 |

**Hook の 3種類が段階的に登場**する設計:
- Session 3: スターター内蔵（①機密情報書き込みブロック、②危険コマンドブロック）
- Session 4: 受講者自作（③秘密ファイル読み込み警告）
- Session 5: 運用時（④コミット時の機密チェック）

### English

| Session | Permissions | Hooks | Skills | CLAUDE.md |
|---------|-------------|-------|--------|-----------|
| 1 | (intro only) | (intro only) | (intro only) | (intro only) |
| 2 | — | — | **Distribute a Review skill**: use AI to review vibe-coded code | — |
| 3 | **In the starter template**: allow/deny rules pre-configured. Participants read them and try a forbidden action to feel that they "actually work" | **Two Hooks in the starter**: (1) block writes containing secrets (`sk-`, `AKIA-`, etc.), (2) block dangerous commands (`rm -rf /`, `curl \| sh`, `sudo`, etc.) | Sample Skill bundled in the starter (similar in spirit to Session 2's Review skill) | Bundled in the starter. Introduced as a way to give the AI knowledge — but we explicitly mark its weakness as a command mechanism |
| 4 | Participants add their own Permissions entries (e.g. restrict destructive DB queries) | **Participants write their own Hook**: implement and test a `.env` / secret-file read warning | (Stretch) Write a custom Skill | Extend CLAUDE.md to match their subject |
| 5 | Use Permissions as a pre-deploy check | **Operational Hook**: a PostToolUse Hook that scans the diff after `git commit` for leaked secrets | — | Accumulate operational know-how in CLAUDE.md |

**The three Hook types appear progressively**:
- Session 3: Bundled (1 secret-write block, 2 dangerous-command block)
- Session 4: Participant-written (3 secret-file read warning)
- Session 5: Operational (4 post-commit secret scan)

## 受講者プロファイル / Participant profile

研修設計の判断基準として使う。お客様から共有された受講者の経験・スキルレベル（研修参加確定メンバーの自己申告ベース）。

Used as the basis for training design decisions. Self-reported experience and skill levels from the confirmed participants, shared by the client.

### 日本語

| 観点 | レベル分布 | 備考 |
|------|-----------|------|
| エンジニアリングスキル・経験 | **レベル2〜3混在** | 要件・設計を受けて実装、レビュー参加経験あり。クラウドアーキテクチャ設計・IaC構築経験者も混在 |
| GitHub 利用経験 | **レベル0〜2混在** | Git操作未経験者から GitHub Actions での CI/CD 構築経験者まで幅広い |
| アジャイル開発経験 | **レベル1〜3混在** | スクラム知識保持者から、PO/SMロールでのリード経験者まで |
| AIコーディングツール（Copilot / Claude Code）利用経験 | **レベル1〜3混在** | 個人的に試した程度から、config/hooks/agents/skills まで活用している人まで |
| レベル2以上の具体経験 | 生成AIソリューション提案書・MOC生成、AI Agent プロト作成など |  |
| 期待・学びたいこと | **「Claude Code 利用時のセキュリティ上の注意と対策」を研修要素に入れてほしい** との要望あり | 研修全体に埋め込む方針 |

#### レベル定義（参考）

- **エンジニアリング**
  - L0: 研修外のコーディング経験なし / L1: 基礎的コーディングが書ける（実務経験なし）/ L2: チーム開発での実装・レビュー経験あり / L3: L2 + クラウドアーキテクチャ設計・IaC構築経験あり
- **GitHub**
  - L0: 概念は知っているが未使用 / L1: Clone・Branch・PR の経験あり / L2: GitHub Actions での CI/CD 経験あり / L3: リポジトリオーナーとして複数リポジトリ管理経験あり
- **アジャイル**
  - L0: 経験・知識なし / L1: 経験はないが知識はある / L2: アジャイル開発経験あり / L3: PO / SM ロールでリード経験あり
- **AIコーディングツール**
  - L0: できることは知っているが未使用 / L1: 個人で試したがプロジェクト未使用 / L2: 実プロジェクトで補完・バグ修正等に活用 / L3: config / hooks / agents / skills 等の設定を活用

#### 設計への反映方針

- **スキル差が大きい前提で設計する**: 同じお題で全員が満足できる設計は難しいため、必須要件＋発展要件の二層構造、ペア/グループでの相互作用、講師による個別フォローを組み合わせる
- **GitHub Actions 未経験者がいる** → Session 5 の CI/CD は「最低限のガイダンス（動かすところまで）」+「自由課題」の二層構造にする
- **セキュリティ観点は受講者要望** → 研修全体の横串トピックとして各セッションに埋め込み、独立した解説セッションも検討
- **AIコーディングツールの経験差が大きい** → L3の人には Hooks / Skills / Rules をリードしてもらう余地を残す（発展課題として位置付け）

#### 受講者環境前提 / Participant environment assumption

- 受講者 PC は**クライアントが用意した Windows PC**を第一環境とする（2026-04-21 時点の方針）
- Mac は参考情報として手順書に併記するが、ドライラン・検証は Windows を基準に行う
- Windows + AWS Workspaces 等の特定環境固有の検証・トラブルシューティングは研修本体ではなく**別 Issue（Optional / Stretch）**で扱う

### English

| Dimension | Level distribution | Notes |
|-----------|-------------------|-------|
| Engineering skills & experience | **Mix of L2 and L3** | Have taken requirements/design and implemented, with code review experience. Some have cloud architecture design and IaC construction experience. |
| GitHub experience | **Mix of L0 through L2** | Ranges from no hands-on Git experience to GitHub Actions CI/CD build experience |
| Agile experience | **Mix of L1 through L3** | From Scrum knowledge to PO/SM leadership experience |
| AI coding tool (Copilot / Claude Code) experience | **Mix of L1 through L3** | From casual personal trials to active use of config / hooks / agents / skills |
| Concrete L2+ experience | Generating proposals / MOCs for generative-AI solutions; building AI agent prototypes |  |
| Expectations / learning goals | **Explicit request to include "security cautions and countermeasures when using Claude Code"** | Will be embedded across the entire training |

#### Level definitions (reference)

- **Engineering**
  - L0: No coding experience outside training / L1: Can write basic code, no production experience / L2: Team implementation + code review experience / L3: L2 + cloud architecture design & IaC construction experience
- **GitHub**
  - L0: Knows concepts, no use / L1: Clone / Branch / PR experience / L2: GitHub Actions CI/CD experience / L3: Repository owner with multi-repo management experience
- **Agile**
  - L0: No experience or knowledge / L1: Knowledge only / L2: Hands-on agile experience / L3: Led as PO / SM
- **AI coding tools**
  - L0: Aware of capabilities, no use / L1: Personal trials, no project use / L2: Used in real projects for completion / fixes / docs / L3: Advanced use of config / hooks / agents / skills

#### Design implications

#### Participant environment assumption

- Participant PCs are primarily **client-provided Windows machines** (policy as of 2026-04-21)
- Mac instructions are kept in the runbook as a reference, but dry-runs and verification are done on Windows
- Environment-specific checks and troubleshooting (e.g. Windows + AWS Workspaces) live in a **separate Optional / Stretch issue**, not in the core training

#### Design implications

- **Design for wide skill gaps**: Combine a two-tier structure (must-have + stretch), pair/group interaction, and facilitator-led follow-up — a single uniform task will not serve everyone
- **Some participants have no GitHub Actions experience** → Session 5's CI/CD uses a two-tier structure: "minimum guided path (get it running)" + "free-form stretch goals"
- **Security is an explicit participant request** → Embed as a cross-cutting topic across all sessions; consider a dedicated discussion slot as well
- **Wide variation in AI-tooling experience** → Leave room for L3 participants to lead on Hooks / Skills / Rules (position these as stretch tracks)

## セッション間の接続ルール / Inter-session handoff rule

### 日本語

- 各セッションの最後に、**次のセッションで必要な準備（インストールすべきツール、確認しておくアカウント、読んでおく資料など）を「宿題」として必ずアナウンスする**
- ただし**宿題はすべて任意（Optional）として案内する**。必須（Must）の宿題は設けない
  - 狙い: 受講者のスキル分布やライフスタイルがバラバラなため、必須化すると参加障壁や罪悪感に繋がる
  - 代替: 次セッション冒頭のハンズオン時間で全員が追いつけるリカバリパス（インストール用の5-10分バッファ等）を設計に含める
- 狙い: 次のセッション冒頭で「〇〇を入れてない人いますか？」という時間ロスを避け、置いてけぼりの受講者を作らない
- 各セッションの「うまくいったと言える状態」に加えて、**「次のセッションに向けた宿題（任意）を全員に伝えきれている」**ことも暗黙のチェックポイントとする

### English

- At the end of every session, **always announce "homework" — the prerequisites for the next session (tools to install, accounts to verify, docs to read)**
- However, **all homework is announced as optional**. There are no mandatory (must-do) homework items.
  - Rationale: participants vary widely in skill and life circumstances; making homework mandatory creates barriers and guilt
  - Mitigation: build a recovery path into the start of the next session (5–10 min install buffer) so participants who didn't do the homework can still keep up
- Intent: avoid the "does anyone not have X installed?" time drain at the start of the next session, and make sure nobody gets left behind
- In addition to each session's explicit success criteria, **having communicated the (optional) homework to everyone** is treated as an implicit checkpoint

## セキュリティ観点の扱い（横串） / Security as a cross-cutting concern

受講者要望に基づき、セキュリティは研修全体を貫く共通トピックとして扱う。**AI 開発を安全に進める**ための視点を3層に整理し、**層1（AI の入出力）と層2（AI の行動ガードレール）を中核**、層3（デプロイ環境）はサブとして扱う。

Per participant request, security runs through the entire training. We organize "safe AI development" in three layers. **Layer 1 (AI I/O) and Layer 2 (AI-behavior guardrails) are the core**; Layer 3 (deployment environment) is a supporting topic.

### 日本語

#### 層1: AI の入出力の安全性（中核）/ Layer 1: AI I/O safety (core)

AI に何を渡すか、AI から何を受け取るかの安全性。

- **プロンプトインジェクション**: 外部ソース（Web ページ、ファイル内容等）に紛れ込んだ指示に AI が従ってしまうリスク
- **機密情報の扱い**: API キー・個人情報をプロンプトに入れない／コミットしない
- **生成コードの鵜呑み禁止**: AI の「完成しました」を検証する習慣
- **セッションへの配置**: 第1回（座学）、第2回（体験として見つける）

#### 層2: AI の行動ガードレール（中核）/ Layer 2: AI behavior guardrails (core)

AI の行動を**仕組みとして制限・監視**する設計。

- **Permissions**（settings.json の allow/deny）: 何をさせるか／させないかを機械的に固定
- **Hooks**: ツール実行前後で検査・ブロック・記録
- **CLAUDE.md（Memory）**: AI に知識や好みを伝える（ただし命令としては弱い）
- **MCP サーバーの権限範囲**: MCP サーバーが触れるデータ／操作を設計時に絞る
- **セッションへの配置**: 第3回（スターター内蔵を体感）、第4回（自分で書く）、第5回（運用時に活かす）

**研修の学びの中心はここ**。AI をどう**制御する**かが、安全な AI 開発の肝。

#### 層3: デプロイ環境の安全性（サブ）/ Layer 3: Deployment environment (supporting)

クラウドに出すときの基本的な安全対策。**独立した座学スライドは設けず、Session 5 のアーキテクチャ説明時に補足として触れる**レベルで扱う。深追いしない。

- IAM 最小権限（CI/CD 用ロール、Lambda 実行ロール）
- Secrets Manager（API キー・DB パスワードの保管）
- ログの扱い（CloudWatch Logs に機密を漏らさない）
- **セッションへの配置**: 第5回のアーキテクチャ/Terraform 雛形説明のなかで補足（独立チェックリスト・独立スライドは作らない）

#### セッション別タッチポイント要約

| Session | 層1: I/O | 層2: ガードレール | 層3: デプロイ |
|---------|---------|------------------|--------------|
| 1 | 座学で概観 | Permissions/Hooks/CLAUDE.md の存在を紹介 | — |
| 2 | ペアレビューで見つける（クライアント側のみのバリデーション、機密情報の露出） | — | — |
| 3 | — | スターター内蔵 Permissions + Hooks を体感 | — |
| 4 | SQL インジェクション対策（MCP が隠蔽する領域 vs 自分で担保すべき領域） | 受講者が Hook を自作 | — |
| 5 | 会話履歴に機密を入れない設計 | 運用 Hook（コミット時の機密チェック） | Terraform 雛形で IAM / Secrets / ログを確認 |

### English

#### Layer 1: AI I/O safety (core)

The safety of what goes into and comes out of the AI.

- **Prompt injection**: the risk of the AI obeying instructions hidden in external sources (web pages, file contents)
- **Handling of secrets**: don't put API keys / PII in prompts; don't commit them
- **Don't blindly trust generated code**: build the habit of verifying the AI's "done"
- **Placement**: Session 1 (lecture), Session 2 (experience it by finding issues)

#### Layer 2: AI behavior guardrails (core)

Mechanisms that **restrict and observe AI behavior**.

- **Permissions** (allow/deny in settings.json): mechanically pin down what's allowed
- **Hooks**: inspect, block, or log at tool-call boundaries
- **CLAUDE.md (Memory)**: give the AI knowledge and preferences (weak as a command mechanism)
- **MCP server permission scope**: narrow the data / actions an MCP server can touch
- **Placement**: Session 3 (feel the bundled ones), Session 4 (write your own), Session 5 (use in operations)

**This is the heart of what the training teaches.** How to **control** AI is the essence of safe AI development.

#### Layer 3: Deployment environment (supporting)

Baseline safety measures in the cloud. **No dedicated slide; covered as a side note while walking through the architecture in Session 5.** No deep dive.

- IAM least privilege (CI/CD role, Lambda execution role)
- Secrets Manager (API keys / DB credentials)
- Log handling (don't leak secrets into CloudWatch Logs)
- **Placement**: Covered as a supplementary note during the Session 5 architecture / Terraform walkthrough (no standalone slide or checklist)

#### Per-session security touch-points (summary)

| Session | Layer 1: I/O | Layer 2: Guardrails | Layer 3: Deploy |
|---------|--------------|---------------------|-----------------|
| 1 | Lecture overview | Introduce existence of Permissions / Hooks / CLAUDE.md | — |
| 2 | Find during peer review (client-only validation, leaked secrets) | — | — |
| 3 | — | Feel the starter's bundled Permissions + Hooks | — |
| 4 | SQL injection defenses (what MCP hides vs. what you must guarantee) | Participants write their own Hook | — |
| 5 | Exclude secrets from conversation history | Operational Hook (post-commit secret scan) | Inspect IAM / Secrets / logs via the Terraform templates |

## 共通テンプレート / Session template

各セッションは以下の構成で記載する（未確定の項目は `TBD` で残してよい）。

- **テーマ**: 1行で何をやるか
- **研修全体での役割**: 研修全体のゴールの中で、このセッションがどこを担うか
- **このセッションの狙い**: このセッションで受講者に体験・理解させたいこと
- **受講後にできるようになること**
  - 知識: 何を「知っている」状態になるか
  - スキル: 何が「できる」状態になるか
  - マインド: どんな感覚・姿勢を持ち帰るか
- **題材**: 使う教材・サンプル
- **アウトプット（成果物）**: 受講者が持ち帰るもの
- **前提**
  - 技術的前提: PC環境・ツール・アカウントなど
  - 知識的前提: 前セッションまでで身につけているべきこと
  - 運営側の事前準備: 講師が事前に用意しておくこと
- **セッション構成案**: 時間配分付きの流れ
- **うまくいったと言える状態**: セッション末のチェックポイント

---

## 第1回（2h） / Session 1 (2h)

### 日本語

- **テーマ**: AI駆動開発トレーニング環境のセットアップ / AI駆動開発概要
- **研修全体での役割**: 研修の入り口。全員を同じスタートラインに立たせ、以降4セッションを円滑に走らせるための土台作り
- **このセッションの狙い**
  - AI駆動開発が何で、なぜ学ぶのかを受講者に腹落ちさせる
  - 全員の PC で Claude Code が動き、MCP サーバーにつながることを確認する
  - MCP という「今回の研修の裏テーマ」をここで植え付ける
- **受講後にできるようになること**
  - 知識: AI駆動開発の概要と、バイブコーディング／プロトタイピング／プロダクション開発の使い分け。MCP が LLM と外部ツールをつなぐ標準プロトコルであること
  - スキル: Claude Code を起動してプロンプトからファイル生成できる。MCP サーバー（filesystem, github 等）を Claude Code から利用できる
  - マインド: 「AI駆動開発、自分にもできそう」と感じる
- **題材**: N/A（環境セットアップと座学が中心）
- **アウトプット（成果物）**
  - Claude Code が動くローカル環境
  - 事前アンケートの回答（全体効果測定用ベースライン）
- **前提**
  - 技術的前提: 各自の PC（Mac / Windows）。管理者権限でツールインストールできること
  - 知識的前提: なし（プログラミング未経験でもついてこれる想定）
  - 運営側の事前準備:
    - **GitHub アカウントの事前確認**（重要）
      - 研修開始の **1週間前までに受講者にアンケート**を送り、GitHub アカウント所持状況を把握
      - 未所持者には**事前にアカウント作成してもらう**よう依頼（作成手順のドキュメントを添付）
      - 研修当日までに取得できない受講者には、**当日セッション冒頭で講師が個別サポート**する時間を確保
      - Session 1 の流れの中で各受講者のアカウント有効性（clone / push できるか）を確認
    - 研修用プライベートリポジトリを作成し、事前確認で判明した受講者の GitHub アカウントを招待
    - **受講者 PC の前提**: クライアント提供の Windows PC を第一環境とする。Mac は参考情報扱い。特定環境（AWS Workspaces 等）固有の検証は**別 Issue（Optional / Stretch）**で扱い、本手順書には組み込まない
    - OS差異（Windows 中心、Mac 参考）のつまずきポイントを Findings として事前整理
      - Node.js のインストール方法（Windows 中心、Mac 参考）
      - `better-sqlite3` ビルド可否（ネイティブモジュールのため、Windows では Visual Studio Build Tools が必要になる可能性）
      - Docker は**必須にしない**（クライアント提供 Windows 環境で WSL2 / Docker Desktop セットアップが重いケースがあるため）。ローカル DB は SQLite + `better-sqlite3` を標準とする
      - Docker を使える受講者向けの代替手順は発展オプションとして別資料で提供
    - LLM 接続方針を事前に決定（Amazon Bedrock Claude または Anthropic Claude API）
      - AWS初期契約アカウントでは Bedrock の TPS が 0 の場合があるため、両対応できる構成とする
      - Bedrock 利用時は inference profile（例: `us.anthropic.*`）の region 設定が複雑。Findings に明記
- **セキュリティタッチポイント**（横串 / 層1中心、層2は存在紹介）
  - AI駆動開発特有のセキュリティ留意点を座学で概観:
    - プロンプトインジェクション（外部ソースからの指示に LLM が従ってしまうリスク）
    - 機密情報の扱い（API キー・個人情報をプロンプトに入れない／コミットしない）
    - 生成コードの鵜呑み禁止（第2回で体験する「再現性のある失敗」に繋げる）
    - ツール権限の考え方（MCP サーバーが何にアクセスできるかは自分で決める）
  - **AI ガードレールの4つの仕組み**（Permissions / Hooks / CLAUDE.md / Skills）の**存在を紹介**（詳細体験は Session 3 以降）
    - Permissions: 中核。「仕組みとして必ず効く」
    - Hooks: 補強。「実行時に検査できる」
    - CLAUDE.md: 補助。「AI に知識を与えるが忘れられうる」
    - Skills: 機能拡張。「再利用可能な手順・ツール」
  - 以降のセッションで都度具体例を扱う旨を予告
- **セッション構成案**
  - (0:00–0:10) オープニング: 研修全体の流れ、第1回のゴール提示
  - (0:10–0:25) 事前アンケート実施（最終回のBefore/After比較用ベースライン）
    - 研修への期待値（学びたいこと、ゴールイメージ）
    - 初期スキルレベル（AI駆動開発・関連ツールの使用経験、プログラミング経験など）
    - ※最終回で同内容＋成長実感・期待値とのギャップ・改善アイデアを収集し、Before/Afterで比較
  - (0:25–0:55) AI駆動開発の概要（座学）
    - AI駆動開発とは何か、従来開発との違い
    - バイブコーディング / プロトタイピング / プロダクション開発の使い分け（第2〜5回の予告）
    - 主要ツール概観（Claude Code 中心）
    - **セキュリティ留意点（受講者要望を反映）**: プロンプトインジェクション、機密情報の扱い、生成コードの鵜呑み禁止、ツール権限
    - 留意点（著作権・品質管理は研修全体を通じて学ぶ旨を宣言）
  - (0:55–1:40) 環境セットアップ（ハンズオン）
    - VS Code のインストール / 起動確認
    - Claude Code 拡張機能のインストール・最新化
    - Claude Code インストール / ログイン
    - **GitHub アカウント確認と研修用リポジトリへの招待受諾 / clone**
      - 事前確認で未所持だった受講者の当日サポート（講師が個別対応）
      - clone / push が通ることを確認
    - 動作確認（簡単なプロンプトでファイル生成）
    - MCP（Model Context Protocol）の概念紹介とハンズオン
      - LLMと外部ツール／データソースをつなぐ標準プロトコルであることを説明
      - Claude Code 既存 MCP サーバー（filesystem, github 等）を接続して動作確認
      - 第3〜5回で自作アプリから MCP 経由で DB アクセスする流れを予告
    - Node.js のインストール確認（第3回以降のローカル開発用、`npm install` で動くことを確認）
  - (1:40–2:00) 振り返り（第2回予告: バイブコーディングと「再現性のある失敗」体験）
- **うまくいったと言える状態**
  - 受講者全員が Claude Code にログインできている
  - 受講者全員が最低1つの MCP サーバーを Claude Code から呼び出せている
  - 事前アンケートが全員回収できている
- **次回への宿題（セッション末にアナウンス）**
  - Google Chrome をインストールしておくこと（第2回のペア相互評価で開発者ツールを使うため）
  - （任意）経費精算アプリのイメージを軽く考えてきてOK（第2回で実装するが、その場で考えても問題ない旨も伝える）

### English

- **Theme**: Setting up the AI-driven development training environment / Overview of AI-driven development
- **Role in the overall program**: The entry point. Get everyone on the same starting line so the remaining four sessions run smoothly.
- **Goal of this session**
  - Get participants to internalize what AI-driven development is and why they're learning it
  - Confirm that Claude Code runs on every participant's machine and can connect to an MCP server
  - Plant MCP as the "hidden theme" of this training here
- **What participants can do after this session**
  - Knowledge: The outline of AI-driven development, and when to use vibe coding / prototyping / production development. That MCP is a standard protocol connecting LLMs to external tools.
  - Skills: Launch Claude Code and generate files from prompts. Use MCP servers (filesystem, github, etc.) from Claude Code.
  - Mindset: "AI-driven development feels within reach for me."
- **Subject**: N/A (focus is on environment setup and lecture)
- **Deliverables**
  - A working local Claude Code environment
  - Pre-training survey responses (baseline for overall effectiveness measurement)
- **Prerequisites**
  - Technical: Participant's own PC (Mac / Windows). Admin rights to install tools.
  - Knowledge: None (designed to work for non-programmers too)
  - Facilitator preparation:
    - **Pre-check GitHub account status** (important)
      - Send a survey to participants at least **one week before the training** to check GitHub account status
      - Ask participants without accounts to **create them in advance** (attach a how-to doc)
      - For participants who still lack an account on the day, **reserve individual facilitator support time at the start of the session**
      - Verify each participant's account is usable (can clone / push) during Session 1
    - Create a private repository for the training and invite the GitHub accounts confirmed by the pre-check
    - **Participant PC assumption**: client-provided Windows PCs are the primary environment. Mac is informational only. Environment-specific checks (e.g. AWS Workspaces) live in a **separate Optional / Stretch issue** and are not folded into this runbook
    - Compile OS-specific pitfalls (Windows primary, Mac reference) as Findings in advance
      - Node.js installation (Windows primary, Mac reference)
      - Can `better-sqlite3` be built on Windows? (it's a native module; Visual Studio Build Tools may be required)
      - Docker is **not a hard requirement** (WSL2 / Docker Desktop can be heavy to set up on client-provided Windows). Local DB is standardized on SQLite + `better-sqlite3`
      - Alternative Docker-based steps for participants who can run Docker are kept as a separate stretch-track doc
    - Decide the LLM connectivity approach (Amazon Bedrock Claude and/or Anthropic Claude API)
      - Initial AWS accounts may have Bedrock TPS set to 0, so the architecture supports both
      - Using Bedrock requires inference profile settings (e.g. `us.anthropic.*`) and region decisions that are non-trivial — capture in Findings
- **Security touch-points** (cross-cutting; Layer 1 focus, Layer 2 introduced only)
  - Lecture overview of AI-driven development security cautions:
    - Prompt injection (risk that the LLM follows instructions coming from external sources)
    - Handling of secrets (don't put API keys / PII in prompts; don't commit them)
    - Don't blindly trust generated code (lead-in to Session 2's "reproducible failures" experience)
    - Tool permissions (you decide what an MCP server can access)
  - **Introduce the existence of the four AI-guardrail mechanisms** (Permissions / Hooks / CLAUDE.md / Skills) — detailed experience starts in Session 3
    - Permissions: core. "Always enforced by the mechanism"
    - Hooks: reinforcement. "Inspected at runtime"
    - CLAUDE.md: supporting. "Gives the AI knowledge but can be forgotten"
    - Skills: capability extension. "Reusable procedures / tools"
  - Preview that each subsequent session will cover concrete examples
- **Session outline**
  - (0:00–0:10) Opening: walkthrough of the full program and goals of Session 1
  - (0:10–0:25) Pre-training survey (baseline for Before/After comparison in the final session)
    - Expectations (what they want to learn, their goal image)
    - Initial skill level (experience with AI-driven development / related tools, programming background)
    - Note: In the final session, collect the same items plus perceived growth, gap vs. expectations, and improvement ideas; compare Before/After
  - (0:25–0:55) Overview of AI-driven development (lecture)
    - What AI-driven development is and how it differs from traditional development
    - When to use vibe coding / prototyping / production development (preview of Sessions 2–5)
    - Overview of major tools (Claude Code–centric)
    - **Security cautions (reflecting participant request)**: prompt injection, handling of secrets, not blindly trusting generated code, tool permissions
    - Cautions (copyright and quality management will be learned throughout the program)
  - (0:55–1:40) Environment setup (hands-on)
    - Install / verify VS Code
    - Install / update the Claude Code extension
    - Install / sign in to Claude Code
    - **GitHub account check and repo invite acceptance / clone**
      - Facilitator-led individual support for anyone still lacking an account
      - Verify clone / push works
    - Smoke test (generate a file from a simple prompt)
    - Introduction to MCP (Model Context Protocol) with a quick hands-on
      - Explain MCP as a standard protocol that connects LLMs to external tools / data sources
      - Connect Claude Code to existing MCP servers (filesystem, github, etc.) and try them out
      - Preview how Sessions 3–5 will access a database through MCP from participants' own apps
    - Verify Node.js installation (needed for local development from Session 3; confirm `npm install` works)
  - (1:40–2:00) Retrospective (preview of Session 2: vibe coding and the "reproducible failures" experience)
- **Success criteria**
  - All participants are signed into Claude Code
  - All participants have invoked at least one MCP server from Claude Code
  - All pre-training surveys are collected
- **Homework for next session (announce at the end)**
  - Install Google Chrome (Session 2's peer review uses the Chrome dev tools)
  - (Optional) Start thinking loosely about an expense-app idea for Session 2 — but spur-of-the-moment ideas are fine too

---

## 第2回（4h） / Session 2 (4h)

### 日本語

- **テーマ**: バイブコーディングのハンズオン / バイブコーディングの限界を「再現性のある失敗」として体験する
- **研修全体での役割**: 「AI に任せきりにするとどうなるか」を全員が共通の学びとして持ち帰る回。第3回以降の「設計を持って進める」価値を理解するための対比ポイント
- **このセッションの狙い**
  - バイブコーディングの速さ（要件をふわっと投げても動くものが出る）を体験させる
  - **受講者同士の相互レビュー**で、自分では気づけない失敗パターンを体感させる
  - セキュリティ観点（認証・バリデーション・機密情報）を**体験として**先取りする（受講者要望）
  - 第3回以降で設計・アーキテクチャを重視する動機づけにする
- **受講後にできるようになること**
  - 知識: バイブコーディングの典型的な落とし穴（要件の拡大解釈、デグレード、UIの堅牢性不足、セキュリティ見落とし、保守性低下）
  - スキル: 自然言語プロンプトだけでアプリの骨格を組み立てられる。他人のアプリを評価観点に沿ってレビューできる。ブラウザ開発者ツールで実装の中を覗ける
  - マインド: AI の「できました」を鵜呑みにせず、「誰が使うのか」「壊れ方を試したか」と一度立ち止まる感覚
- **題材**: 経費精算アプリケーション
  - **実装は完全自由**。機能・技術スタック・DBの有無は各自判断（モックアプリでもOK）
  - セッションの途中で、講師から**追加機能リスト**が配布される。各自、未実装の機能から1つ選んで追加実装してもらう（これで全員が「修正によるデグレード」を体験する）
- **アウトプット（成果物）**
  - 受講者ごとの経費精算アプリ（完成度・機能は問わない）
  - ペア相互評価で発見された「失敗メモ」
- **前提**
  - 技術的前提:
    - 第1回で整備した Claude Code 環境
    - **Google Chrome**（ペア相互評価で開発者ツールを使うため。Session 1 末尾の宿題で事前インストール案内済み）
  - 知識的前提: 第1回の内容（Claude Code の基本操作、MCP の概念、セキュリティ留意点の概観）
  - 運営側の事前準備:
    - 経費精算アプリのお題文書（実装自由であることを明記）
    - **追加機能リスト**（固定、講師が事前に用意）: 例）承認フロー、カテゴリ別集計、検索、編集・削除、CSVエクスポート、画像アップロード、ソート、複数ユーザー対応
    - **評価観点リスト**（モックアプリでも適用可能な範囲に限定）
      1. 要件の明確性: 誰がどんな目的で使うのか
      2. 入力の堅牢性: 空欄・極端な値・特殊文字を試す
      3. ボタン・機能配置: 不要な機能、漏れている機能
      4. エラー時の挙動: 存在しないデータを表示しようとしたら？
      5. セキュリティ: DevToolsで機密情報・APIキーの露出を確認、クライアント側のみのバリデーションを確認
      6. 保守性: コードが1週間後の自分に読めるか
      7. デグレード: 追加機能を入れた後、最初に動いていた機能は今も動くか
      8. 「完成」の定義: AI が「完成しました」と言ったこと、全部動くか
    - **開発者ツール使い方資料**（ペア相互評価の直前に配布）
      - Chrome で開くこと
      - Elements / Console / Network / Application タブの基本的な使い方
      - DevTools で機密情報を探す／ペイロードを改ざんするサンプル手順
    - ペア編成の方針（AIツール経験レベル L1 と L3 を混ぜる等、スキル差を活かす）
    - **Review スキル（Claude Code Skill）の事前準備**（後述のセッション構成で配布する）
      - 内容: バイブコーディングで作ったコードを自動的にレビューし、「動いているが危ういパターン」を洗い出す手順書（Markdown の Skill として定義）
      - レビュー観点: 評価観点リストと連動（入力の堅牢性、エラー処理、セキュリティ、保守性、デグレード、完成の定義）
      - 配布タイミング: ペア相互評価の直前〜直後（受講者が他人のアプリを見た後、自分のコードも Skill で見直す流れ）
      - 狙い: 「AI を使って AI のコードをレビューする」感覚を実体験する。Skill という仕組みの効果を実感する
- **セッション構成案**（現時点の想定、今後詰める）
  - (0:00-0:10) お題提示（経費精算アプリ、実装完全自由）、評価観点の予告、進め方説明
  - (0:10-1:30) 第1フェーズ: 各自バイブコーディング（80分）
  - (1:30-1:40) 講師から「追加機能リスト」配布。未実装の機能から1つ選んで追加実装する旨を指示
  - (1:40-2:30) 第2フェーズ: 追加実装（50分） ← **ここで多くの受講者がデグレードを体験**
  - (2:30-2:40) 休憩
  - (2:40-2:50) **開発者ツール使い方資料の配布**、ペア相互評価の進め方説明
  - (2:50-3:20) ペア相互評価（30分）: 評価観点リストに沿って他人のアプリを触る
  - (3:20-3:35) **Review スキル配布 + 自分のコードに適用（15分）**
    - 講師が Review スキルを受講者に配布（Claude Code Skill として）
    - 受講者が自分のコードに Skill を適用して AI にレビューさせる
    - 「AI が AI のコードをレビューする」を体感する
    - Session 3 のスターターテンプレートにも Skill が入ることを予告
  - (3:35-3:50) 共通失敗の共有・座学（15分）
    - 各ペア + Skill から出た「失敗あるある」を共有
    - バイブコーディングが見落としがちなパターンの言語化
    - **セキュリティ観点の解説（受講者要望反映）**: 認証不在、クライアント側のみのバリデーション、機密情報の露出、プロンプトに機密を入れない
    - 「設計を持って進める」第3回への橋渡し
  - (3:50-4:00) 振り返り、次回への宿題アナウンス
- **セキュリティタッチポイント**（横串）
  - 評価観点 #5 で **DevTools から機密情報・API キーの露出を探す**、**ペイロード改ざんを試す** を全員が体験
  - 共通失敗の座学で「バイブコーディングは指示しないとセキュリティを作らない」を言語化
- **うまくいったと言える状態**
  - 受講者全員が何かしらの「経費精算アプリ」を動かしている
  - ペア相互評価で、受講者全員が自分のアプリの失敗を少なくとも1つは指摘されている
  - セキュリティの初歩的注意点（認証・バリデーション・機密情報の露出）を自分の言葉で説明できる
  - 「動いているように見えても壊れている」「修正するとデグレードする」という共通体験を全員が持っている
- **次回への宿題（セッション末にアナウンス）**
  - Node.js のインストール確認（`node -v` / `npm -v` が通ること）
  - SQL の初歩を軽く復習（未経験者向けに参考資料リンクを配布。Chinook スキーマの概観含む）

### English

- **Theme**: Hands-on vibe coding / Experience vibe-coding's limits as a "reproducible failure"
- **Role in the overall program**: The session where all participants take home a shared understanding of "what happens when you hand everything to the AI." A contrast point that makes the value of "proceed with a design" in Sessions 3–5 land.
- **Goal of this session**
  - Let participants feel the speed of vibe coding (vague requirements in → something running out)
  - **Peer review among participants** surfaces failure patterns that individuals cannot spot on their own
  - Surface security concerns (auth, validation, secrets) **as experience** up front (participant request)
  - Motivate the emphasis on design and architecture in Sessions 3–5
- **What participants can do after this session**
  - Knowledge: Typical vibe-coding pitfalls (scope creep, regression when modifying, weak UI robustness, missing security, declining maintainability)
  - Skills: Assemble an app skeleton from natural-language prompts alone. Review someone else's app against a checklist. Use the browser dev tools to peek inside an implementation.
  - Mindset: Pause before accepting the AI's "done" — ask "who uses this?" and "have you tried breaking it?"
- **Subject**: An expense reimbursement application
  - **Implementation is fully up to the participant.** Features, tech stack, presence of a DB — all free to choose (a mock app is fine)
  - Mid-session, the facilitator distributes a **fixed list of add-on features**. Each participant picks one feature they haven't built yet and implements it (this ensures everyone experiences "modifying causes regression")
- **Deliverables**
  - A per-participant expense app (any shape, any completeness)
  - "Failure notes" surfaced during peer review
- **Prerequisites**
  - Technical:
    - Claude Code environment set up in Session 1
    - **Google Chrome** (for the dev-tools peer review; pre-install was announced as homework at the end of Session 1)
  - Knowledge: Session 1 content (Claude Code basics, MCP concept, security overview)
  - Facilitator preparation:
    - Expense-app prompt document (states that implementation is free)
    - **Fixed list of add-on features** (prepared in advance by the facilitator): e.g. approval flow, category aggregation, search, edit/delete, CSV export, image upload, sort, multi-user
    - **Evaluation criteria list** (limited to items applicable even to mock apps)
      1. Clarity of requirements: who uses this and for what?
      2. Input robustness: try empty, extreme, special-character inputs
      3. Buttons/feature layout: extraneous features, missing features
      4. Behavior on failure: what if you try to show a non-existent item?
      5. Security: use DevTools to check for leaked secrets / API keys, and client-only validation
      6. Maintainability: can your future self read this code in a week?
      7. Regression: after the add-on, do the original features still work?
      8. Definition of "done": everything the AI claimed to finish actually works?
    - **Dev-tools usage doc** (distributed right before peer review)
      - Use Chrome
      - Basic usage of Elements / Console / Network / Application tabs
      - Sample procedures for finding secrets in DevTools / tampering with request payloads
    - Pair-formation policy (e.g. mix AI-tool L1 and L3 participants to leverage the skill gap)
    - **Pre-prepare a Review skill (a Claude Code Skill)** to be distributed during the session
      - Contents: a Markdown-defined Skill that auto-reviews vibe-coded code and surfaces "looks-fine-but-fragile" patterns
      - Review lens: aligned to the evaluation criteria (input robustness, error handling, security, maintainability, regression, definition of done)
      - Timing: distributed right after the peer review (participants use it on their own code after looking at someone else's)
      - Intent: let participants feel "using AI to review AI's code" firsthand and experience what a Skill actually does
- **Session outline** (current working assumption, still being refined)
  - (0:00-0:10) Present the brief (expense app, fully free implementation), preview of evaluation criteria, walkthrough of the session
  - (0:10-1:30) Phase 1: Individual vibe coding (80 min)
  - (1:30-1:40) Facilitator distributes the "add-on features list". Each participant picks one they haven't built and implements it
  - (1:40-2:30) Phase 2: Add-on implementation (50 min) ← **This is where most participants experience regression**
  - (2:30-2:40) Break
  - (2:40-2:50) **Distribute the dev-tools usage doc**; explain the peer-review flow
  - (2:50-3:20) Peer review (30 min): use the evaluation criteria to touch someone else's app
  - (3:20-3:35) **Distribute the Review skill + apply it to your own code (15 min)**
    - Facilitator distributes the Review skill (as a Claude Code Skill)
    - Participants apply the Skill to their own code and let AI review it
    - Experience "AI reviewing AI's code"
    - Preview that Session 3's starter template will also ship with Skills
  - (3:35-3:50) Share common failures + lecture (15 min)
    - Each pair + the Skill surface "failure patterns"
    - Articulate what vibe coding tends to miss
    - **Security walkthrough (reflecting participant request)**: missing auth, client-only validation, leaked secrets, don't put secrets in prompts
    - Hand-off to Session 3's "move with a design"
  - (3:50-4:00) Retrospective, announce homework for next session
- **Security touch-points** (cross-cutting)
  - Under evaluation criterion #5, everyone actually **uses DevTools to look for leaked secrets / API keys and tries to tamper with payloads**
  - The closing lecture articulates "vibe coding doesn't build security unless you tell it to"
- **Success criteria**
  - Every participant has some form of "expense app" running
  - Every participant has had at least one flaw in their app pointed out during peer review
  - Every participant can articulate at least the basics of security (auth, validation, secrets) in their own words
  - Everyone shares the visceral experience of "it looks working but it's broken" and "fixing one thing regresses another"
- **Homework for next session (announce at the end)**
  - Verify Node.js is installed (`node -v` / `npm -v` both work)
  - Lightly brush up on SQL basics (share reference links for anyone new to SQL, plus a Chinook schema overview)

---

## 第3回（4h） / Session 3 (4h)

### 日本語

- **テーマ**: AI駆動開発実践① 〜 プロトタイプによる事業アイディア具体化
- **研修全体での役割**: 「設計を持った AI 駆動開発」の入り口。第2回のバイブコーディングとの対比で、参照アーキテクチャに沿ってプロトタイプを組み立てる進め方を体験する回
- **このセッションの狙い**
  - 事業アイディアを具体的なモックアップに落とし込むスピード感を AI とともに体験する
  - スターターテンプレートをベースに、エージェントアプリの骨格を組み立てる
  - MCP を「使う側」として自分のアプリに組み込み始める
- **受講後にできるようになること**
  - 知識: 参照アーキテクチャ（ローカル → クラウドを見据えた構成）の構成要素とそれぞれの役割
  - スキル: スターターテンプレートから着手し、チャット UI と最小限のエージェントを動かす
  - マインド: 「設計を持って AI と進める方が結果的に速い」と感じる
- **題材**: SQL×AI エージェントアプリの初期プロトタイプ（自然言語 → SQL → 可視化）（TBD: 第3回に割り当てるか第4回に割り当てるかは全体整理後に確定）
- **アウトプット（成果物）**
  - ローカルで動くチャット UI のモックアップ
  - 最小限のエージェント（単発の質問に答える程度）
- **前提**
  - 技術的前提: 第1回の Claude Code 環境 + Node.js（Docker は**必須にしない**）
  - 知識的前提: 第1回（MCP 概念）、第2回（バイブコーディングの体験）
  - 運営側の事前準備:
    - スターターテンプレート／プロジェクト雛形（第3回で即着手できる状態）
      - **Permissions**: `settings.json` に allow/deny が設定済み（危険コマンドや機密書き込みの拒否ルール）
      - **Hooks**: 2種類を内蔵
        - Hook①: PreToolUse で機密情報（`sk-`, `AKIA-` 等）の書き込みをブロック
        - Hook②: PreToolUse で危険コマンド（`rm -rf /`, `curl \| sh`, `sudo` 等）のブロック
      - **Skills**: サンプルの Skill を 1 つ同梱（Session 2 の Review スキル同等品）
      - **CLAUDE.md**: プロジェクト固有の知識・指示を記載（題材説明、技術スタック、禁則事項など）
      - 狙い: 「スターターには最初から AI ガードレールが入っている」を体感し、各仕組みの役割を理解する
    - 参照アーキテクチャ図の完成
    - Chinook サンプルデータを **SQLite 形式**で用意（`.db` ファイルをリポジトリに同梱、または配布手順を整備）
    - `better-sqlite3` のインストール手順検証（ネイティブモジュールのビルドが Windows / Mac で通るか）
    - Docker 経由で PostgreSQL を立てたい発展受講者向けの代替手順を別資料として用意
- **AI ガードレールのタッチポイント**（層2中心）
  - 受講者は Permissions の allow/deny を読む → 試しに禁止操作（例: 危険コマンド）を AI に頼んで**ブロックされる体験**
  - Hook が実行前に効くのを目撃する（機密情報書き込みブロック、危険コマンドブロック）
  - CLAUDE.md が**AI に読まれているが、長い会話で薄れることもある**ことを実例で示す
  - Skill は「再利用可能な手順」であることを紹介（Session 2 で既に体験済み）
- **セッション構成案**: （TBD: 4時間の配分を詰める）
- **うまくいったと言える状態**
  - 受講者全員のローカルでチャット UI が立ち上がる
  - AI に質問すると（固定応答でも）何らかの応答が返る状態に到達
- **次回への宿題（セッション末にアナウンス）**
  - 第4回で使う PostgreSQL MCP サーバーのパッケージを事前に入手（npm install 等）
  - 自分のアプリで「対話の履歴を持たせたい」イメージを軽く考えてくる（実装は次回）

### English

- **Theme**: AI-driven development practice ① — Materializing a business idea via a prototype
- **Role in the overall program**: The entry point to "AI-driven development with a design." In contrast to Session 2's vibe coding, participants experience building a prototype along a reference architecture.
- **Goal of this session**
  - Feel the speed at which a business idea can be turned into a concrete mockup, with the AI as partner
  - Assemble the skeleton of an agent application on top of a starter template
  - Start using MCP from the "consumer" side — wire it into their own app
- **What participants can do after this session**
  - Knowledge: The components of the reference architecture (local → cloud-ready) and what each one does
  - Skills: Start from a starter template and get a chat UI plus minimal agent running
  - Mindset: "Moving forward with a design is ultimately faster when working with AI"
- **Subject**: Initial prototype of the SQL×AI agent app (natural language → SQL → visualization) (TBD: whether this lands in Session 3 or Session 4 is decided after the overall layout is fixed)
- **Deliverables**
  - A locally runnable chat UI mockup
  - A minimal agent (answers single-turn questions at least)
- **Prerequisites**
  - Technical: Session 1's Claude Code environment + Node.js (Docker is **not required**)
  - Knowledge: Session 1 (MCP concept), Session 2 (the vibe-coding experience)
  - Facilitator preparation:
    - Starter template / project skeleton (ready to start immediately in Session 3)
      - **Permissions**: allow/deny pre-configured in `settings.json` (deny rules for dangerous commands and secret writes)
      - **Hooks**: two Hooks bundled
        - Hook 1: PreToolUse that blocks writes containing secrets (`sk-`, `AKIA-`, etc.)
        - Hook 2: PreToolUse that blocks dangerous commands (`rm -rf /`, `curl \| sh`, `sudo`, etc.)
      - **Skills**: one sample Skill bundled (spiritually similar to Session 2's Review skill)
      - **CLAUDE.md**: project-specific knowledge / instructions (subject description, tech stack, prohibitions, etc.)
      - Intent: let participants feel "the starter already has AI guardrails built in" and understand each mechanism's role
    - Reference architecture diagram finalized
    - Prepare Chinook sample data in **SQLite form** (ship a `.db` file in the repo or provide a distribution procedure)
    - Verify `better-sqlite3` installs cleanly (the native module builds on both Windows and Mac)
    - Prepare a separate stretch-track doc for participants who want to run PostgreSQL via Docker
- **AI guardrail touch-points** (Layer 2 focus)
  - Participants read the allow/deny Permissions → try a forbidden action (e.g. a dangerous command) and **experience it being blocked**
  - Watch a Hook fire before execution (secret-write block, dangerous-command block)
  - Observe that CLAUDE.md is **being read by the AI, but can fade over long conversations** — shown with a concrete example
  - Introduce Skills as "reusable procedures" (already experienced in Session 2)
- **Session outline**: (TBD: work out the 4-hour breakdown)
- **Success criteria**
  - The chat UI boots on every participant's local machine
  - Asking the AI a question returns some response (even if canned)
- **Homework for next session (announce at the end)**
  - Pre-install the PostgreSQL MCP server package (via npm install, etc.) before Session 4
  - Sketch out what "conversation history" would look like in your app (implementation comes next time)

---

## 第4回（4h） / Session 4 (4h)

### 日本語

- **テーマ**: AI駆動開発実践② 〜 プロトタイプの機能改善
- **研修全体での役割**: モックアップに「本物の知能」を入れていく回。MCP で DB に実接続し、会話形式で動くところまで持っていく
- **このセッションの狙い**
  - MCP 経由で PostgreSQL に実接続し、自然言語で SQL が走る体験をさせる
  - 会話履歴の保持、複数ターンのやり取り、エラー対応など「使えるアプリにするための作り込み」を味わわせる
  - （発展）カスタム MCP サーバーを自作する体験
- **受講後にできるようになること**
  - 知識: MCP サーバーと MCP クライアントの役割分担、stdio 通信の実態。会話履歴をどこに持たせるか（DynamoDB Local の役割）
  - スキル: 既存 MCP サーバーを自作エージェントから呼び出し、対話形式で DB に問い合わせできる
  - マインド: 「エージェント = LLM + ツール + 履歴」であるという実装レベルの理解
- **題材**: SQL×AI エージェントアプリ（Chinook サンプルデータに対する自然言語クエリ）（TBD: 割り当ては全体整理後）
- **アウトプット（成果物）**
  - MCP 経由で PostgreSQL に実接続している対話型エージェント
  - 会話履歴が残るローカルアプリ
- **前提**
  - 技術的前提: 第3回のプロトタイプが動く状態
  - 知識的前提: 第3回のアーキテクチャ理解
  - 運営側の事前準備:
    - PostgreSQL MCP サーバー（`@modelcontextprotocol/server-postgres` など）の動作検証
    - DynamoDB Local のセットアップ手順
    - カスタム MCP サーバー自作のサンプル実装（発展課題用）
    - **受講者が自作する Hook の題材準備**
      - Hook③: PreToolUse で `.env` / 秘密ファイルの読み込み警告 Hook（受講者が書く）
      - 講師は実装例と手順書を用意（受講者がつまずいたら見せる想定）
    - **Permissions の拡張題材準備**
      - 例: DB 破壊系クエリ（DROP、TRUNCATE 等）を MCP 経由で実行しないようにする allow/deny 設計
- **AI ガードレールのタッチポイント**（層2中心、層1 も一部）
  - **受講者自身で Hook を書くハンズオン**（Hook③ 秘密ファイル読み込み警告）
    - 「Hook は自分で書ける」を実感する
    - 実装 → 動作確認 → 意図的に `.env` を AI に読ませようとしてブロックされる体験
  - Permissions を自分で追記する（例: DB 破壊クエリの deny）
  - **SQL インジェクション対策**（層1）: MCP が内部で何を守っているか／何を受講者が担保すべきかを座学＋コードリーディング
  - 会話履歴の設計で「機密情報を入れない」を議論
- **セッション構成案**: （TBD: 4時間の配分を詰める）
- **うまくいったと言える状態**
  - 受講者が Chinook データに対して自然言語で質問し、妥当な SQL 結果が返る
  - 会話の文脈（前ターンの内容）が次のターンに反映される
- **次回への宿題（セッション末にアナウンス）**
  - AWS アカウントの準備と動作確認（`aws sts get-caller-identity` が通ること）
  - AWS CLI と Terraform のインストール確認
  - （任意）Session 5 用に自分のアプリを整理しておく（余計なブランチ・中途半端な変更を整理）

### English

- **Theme**: AI-driven development practice ② — Improving the prototype's features
- **Role in the overall program**: The session where participants put "real intelligence" into the mockup. Get to the point where MCP talks to a real DB and the app works conversationally.
- **Goal of this session**
  - Have participants experience a real MCP connection to PostgreSQL — natural language in, SQL out
  - Let them taste the "polish that makes an app actually useful": conversation history, multi-turn exchanges, error handling
  - (Stretch) Experience authoring a custom MCP server
- **What participants can do after this session**
  - Knowledge: The split of responsibilities between MCP server and MCP client, and what stdio transport actually looks like. Where conversation history lives (the role of DynamoDB Local).
  - Skills: Call an existing MCP server from a custom agent and hold a conversational DB Q&A
  - Mindset: An implementation-level understanding that "an agent = LLM + tools + history"
- **Subject**: The SQL×AI agent app (natural-language queries over Chinook sample data) (TBD: final session assignment after overall layout is decided)
- **Deliverables**
  - A conversational agent with a real MCP → PostgreSQL connection
  - A local app that retains conversation history
- **Prerequisites**
  - Technical: The Session 3 prototype running
  - Knowledge: Understanding of the Session 3 architecture
  - Facilitator preparation:
    - Verify the PostgreSQL MCP server (`@modelcontextprotocol/server-postgres`, etc.) works end-to-end
    - DynamoDB Local setup instructions
    - A sample implementation of a custom MCP server (for the stretch track)
    - **Prepare the Hook participants will write**
      - Hook 3: a PreToolUse Hook that warns on reading `.env` / secret files (participants implement it)
      - Facilitators have a reference implementation and a step-by-step doc ready for anyone who gets stuck
    - **Prepare the Permissions-extension subject**
      - E.g. design allow/deny rules that prevent destructive DB queries (DROP, TRUNCATE, etc.) from going through MCP
- **AI guardrail touch-points** (Layer 2 focus, with some Layer 1)
  - **Hands-on: participants write their own Hook** (Hook 3, the `.env` read warning)
    - Feel that "Hooks are something I can write"
    - Implement → test → deliberately ask the AI to read `.env` and watch it get blocked
  - Participants add their own Permissions entries (e.g. deny destructive DB queries)
  - **SQL injection defenses** (Layer 1): lecture + code reading on what MCP protects internally vs. what the developer must guarantee
  - Discuss keeping secrets out of conversation history
- **Session outline**: (TBD: work out the 4-hour breakdown)
- **Success criteria**
  - Participants ask natural-language questions about Chinook data and get plausible SQL-backed answers
  - Prior-turn context is reflected in the next turn
- **Homework for next session (announce at the end)**
  - Prepare an AWS account and verify access (`aws sts get-caller-identity` works)
  - Confirm AWS CLI and Terraform are installed
  - (Optional) Tidy up your app for Session 5 (clean up stale branches / half-done changes)

---

## 第5回（4h） / Session 5 (4h)

### 日本語

- **テーマ**: AI駆動開発実践③ 〜 プロトタイプのリリース
- **研修全体での役割**: 「ローカルで動くもの」と「クラウドに出す」の間にあるギャップを体験する回。実務につながる閉め
- **このセッションの狙い**
  - ローカルで動くエージェントを AWS にデプロイし、URL でアクセスできる状態まで持っていく
  - ローカルと本番の違い（認証、IAM、シークレット管理、CloudWatch Logs でのデバッグ）を体験する
  - CI/CD の体験を「全員がついていける最低限」と「余裕のある人の自由課題」の二層で設計
  - 研修全体の学びを振り返り、現場に持ち帰るイメージを作る
- **受講後にできるようになること**
  - 知識: Lambda コンテナイメージの仕組み、Bedrock / Claude API の切替方針、AWS 無料枠の全体像、CI/CD の基本（GitHub Actions による自動デプロイの雛形）
  - スキル: Terraform で AWS リソースを立ち上げ、Lambda に自作エージェントをデプロイし、ブラウザから触れる。GitHub Actions での自動デプロイ（最低限のワークフロー）を動かせる
  - マインド: 「研修が終わった後も、この構成なら自分で試せる」「CI/CD は魔法ではなく、自分でも組める」
- **題材**: 第3-4回で作ったエージェントアプリを AWS にデプロイ
- **アウトプット（成果物）**
  - クラウドで動くエージェントアプリ（CloudFront URL でアクセス可能）
  - 動作する GitHub Actions ワークフロー（最低限: push で自動デプロイまで）
  - 事後アンケート（Before/After 比較用）
- **前提**
  - 技術的前提:
    - 第4回で対話できるようになっているローカルアプリ
    - AWS アカウント（個人 or 研修用）。Session 4 末尾の宿題で `aws sts get-caller-identity` 動作確認済み
    - AWS CLI / Terraform がインストール済み
  - 知識的前提: 第3-4回のアーキテクチャ理解
  - 運営側の事前準備:
    - Terraform 雛形（Lambda, API Gateway, RDS, DynamoDB, Secrets Manager, CloudFront + S3）
    - デプロイ手順ドキュメント（講師が事前にドライラン済み）
    - Bedrock / Claude API の切替方法 Findings
    - クリーンアップ手順（研修後の課金を防ぐため `terraform destroy` を必ず実行させる）
    - **CI/CD 雛形の二層構造**
      - **最低限ガイダンス（必須）**: 受講者全員が動かす、`main` push で `terraform apply` と Lambda コンテナデプロイが走る GitHub Actions ワークフロー。手順は step-by-step ドキュメントで完全に手が止まらないレベルにする
      - **発展課題（自由）**: PR時の計画表示 (`terraform plan`)、コンテナイメージビルドの高速化（レイヤキャッシュ）、ステージング→本番のブランチ戦略、Slack 通知、セキュリティスキャン等。余裕のある受講者向けにネタだけ提示
    - GitHub Actions 未経験者向けに、GitHub Actions の概念ミニ資料（ワークフロー・ジョブ・ステップとは）を用意
- **AI ガードレールのタッチポイント**（層2中心 + 層3 軽め）
  - **運用時 Hook の導入（Hook④）**: PostToolUse で `git commit` 後に差分スキャン、機密情報が含まれていたら警告 or commit ブロック
    - 受講者が自分のリポジトリに Hook を追加して動作確認
    - 「デプロイ前の最後の安全網」として位置付ける
  - Permissions をデプロイ前チェックに活用（例: `terraform destroy` 実行前に確認プロンプトを要求する ルール）
  - CLAUDE.md に運用ノウハウ（デプロイ手順、トラブル時の対応）を蓄積する発想を紹介
- **セキュリティタッチポイント**（層3 = アーキテクチャ説明時の補足のみ）
  - **独立スライド・独立チェックリストは作らない**。AWS インフラ構成図 / Terraform 雛形の walkthrough のなかで一言ずつ添える
  - 触れる内容（口頭補足）: IAM 最小権限、Secrets Manager、`.env` をコミットしない、CloudWatch Logs への機密情報漏洩防止（層1 の応用）、Bedrock / Claude API キーの扱い
  - ※ Terraform 雛形で実現済みのものを**読んで確認する**レベル。深追いしない
- **セッション構成案**: （TBD: 4時間の配分を詰める。目安は「デプロイ手順に沿ったハンズオン → CI/CD 最低限 → 運用時 Hook 導入 → 発展課題時間 → 振り返り → 事後アンケート → destroy」。層3 セキュリティはアーキテクチャ説明の補足として統合）
- **うまくいったと言える状態**
  - 受講者全員のアプリが CloudFront URL で応答する
  - 受講者全員が GitHub Actions で自動デプロイを1回以上成功させている
  - 事後アンケート回収率 100%
  - 全員が `terraform destroy` までやってリソース削除を確認している
- **次回への宿題**: なし（最終回）。研修後の自己学習ネタとして発展課題リストを配布

### English

- **Theme**: AI-driven development practice ③ — Releasing the prototype
- **Role in the overall program**: The session where participants feel the gap between "runs locally" and "ships to the cloud." A closing session that connects the training to real work.
- **Goal of this session**
  - Deploy the locally-running agent to AWS so it's reachable via a URL
  - Experience the differences between local and production (auth, IAM, secret management, debugging via CloudWatch Logs)
  - Design the CI/CD experience as two tiers: "minimum path everyone can follow" and "free-form stretch goals for those with bandwidth"
  - Reflect on the whole training and form a picture of what to take back to the workplace
- **What participants can do after this session**
  - Knowledge: How Lambda container images work, how to switch between Bedrock and Claude API, the overall AWS free-tier picture, CI/CD basics (a GitHub Actions scaffold for automated deploys)
  - Skills: Stand up AWS resources with Terraform, deploy their own agent to Lambda, and use it from a browser. Run a minimal GitHub Actions workflow that auto-deploys.
  - Mindset: "Even after the training ends, I can keep experimenting with this setup on my own." / "CI/CD isn't magic — I can build it myself."
- **Subject**: The agent app built in Sessions 3–4, deployed to AWS
- **Deliverables**
  - An agent app running in the cloud, reachable at a CloudFront URL
  - A working GitHub Actions workflow (minimum: push triggers an automated deploy)
  - Post-training survey (for Before/After comparison)
- **Prerequisites**
  - Technical:
    - A local app that supports conversation from Session 4
    - An AWS account (personal or training-provided), with `aws sts get-caller-identity` verified during Session 4's homework
    - AWS CLI / Terraform installed
  - Knowledge: Understanding of the Session 3–4 architecture
  - Facilitator preparation:
    - Terraform scaffolding (Lambda, API Gateway, RDS, DynamoDB, Secrets Manager, CloudFront + S3)
    - Deployment runbook (dry-run by facilitators beforehand)
    - Findings on switching between Bedrock and Claude API
    - Cleanup procedure (make sure `terraform destroy` is run after the training to avoid lingering charges)
    - **Two-tier CI/CD scaffolding**
      - **Minimum guided path (required)**: A GitHub Actions workflow that every participant runs: push to `main` triggers `terraform apply` and Lambda container deploy. Ships with a step-by-step doc so nobody gets stuck
      - **Stretch track (free-form)**: Show `terraform plan` on PRs, speed up container builds (layer caching), branching strategy for staging→prod, Slack notifications, security scans, etc. Just seed ideas for participants who have bandwidth
    - A short intro doc on GitHub Actions concepts (workflow / job / step) for participants without GHA experience
- **AI guardrail touch-points** (Layer 2 focus, Layer 3 light)
  - **Introduce an operational Hook (Hook 4)**: PostToolUse that scans the diff after `git commit` for leaked secrets and warns or blocks
    - Participants add it to their own repo and verify it
    - Framed as "the final safety net before deploy"
  - Use Permissions as a pre-deploy check (e.g. require a confirmation prompt before `terraform destroy`)
  - Introduce the idea of accumulating operational know-how (deploy procedures, incident response) in CLAUDE.md
- **Security touch-points** (Layer 3 = side notes during the architecture walkthrough only)
  - **No standalone slide or checklist.** Mention briefly during the AWS architecture / Terraform walkthrough.
  - Topics mentioned in passing: IAM least privilege, Secrets Manager, don't commit `.env`, prevent leaking secrets into CloudWatch Logs (application of Layer 1), handling of Bedrock / Claude API keys
  - Note: keep this to "read and confirm what's already implemented in the Terraform templates" — no deep dive
- **Session outline**: (TBD: work out the 4-hour breakdown. Rough guide: "follow the deploy runbook hands-on → minimum CI/CD → introduce the operational Hook → stretch-track time → retrospective → post-training survey → destroy". Layer-3 security is folded into the architecture walkthrough rather than a dedicated lecture.)
- **Success criteria**
  - Every participant's app responds at a CloudFront URL
  - Every participant has triggered at least one successful GitHub Actions auto-deploy
  - 100% post-training survey response rate
  - Everyone has run `terraform destroy` and confirmed resource deletion
- **Homework for next session**: None (final session). Hand out a list of stretch topics as self-study material for after the training

---

## 共通方針：第3〜5回のアーキテクチャ前提 / Common policy: Architecture assumptions for Sessions 3–5

### 日本語

- 第5回で「クラウドで動くプロトタイプ」まで到達することを見据え、第3回の時点から**クラウドリリース可能なアーキテクチャ**を前提に開発を進める
- 研修コンテンツとして、以下を事前に用意しておく
  - 参照アーキテクチャ図（ローカル開発 → クラウドデプロイまでの構成）
  - スターターテンプレート／プロジェクト雛形（第3回で即着手できる状態）
  - 採用技術スタック（フロント／バック／DB／ホスティング等）と選定理由
  - デプロイ手順・IaC・CI/CDの雛形（第5回でスムーズに移行できるよう）
- 狙い: 第3・4回での試行錯誤が第5回のクラウド化時に手戻りにならないようにする

#### 主題材 / Subject matter

- **自然言語 → SQL → 可視化・洞察** を題材とした、対話型エージェントアプリケーション
- **「総合的に回答する」**ことを狙う。単発クエリではなく、エージェントが**複数クエリを自律的に計画・実行・統合**して回答する体験を中心に据える
  - 例: 「セールスNo.1 の従業員とその売り上げに占めるレコードの種類は？」
    - エージェントが (1) 売上ランキングクエリ → (2) トップの従業員の売上明細 → (3) レコード種類別集計 を自律的に実行し、結果を統合して回答
- シンプルなエージェントアプリ（チャット UI で DB に質問する形式）を構築する
- 第3〜5回のどの回に割り当てるかは、全体を整理した上で別途決定（現状: 第3回=骨格、第4回=MCP実接続、第5回=クラウド化、という流れを仮置き）

##### 題材データの将来検討事項 / Future considerations for the subject dataset

現状: **Chinook**（音楽ストアの英語データ）を使う。これは Docker 不要・SQLite 対応が公式配布されている妥協的選択。

将来の選択肢として以下を検討:

- **(a) Chinook の日本語化**: スキーマは流用し、アーティスト名・アルバム名・曲名を日本のものに置換。AI でデータ生成可能
- **(b) 仮想社内 CRM の自作**: クライアントの業務文脈に寄せたスキーマ＋データを AI で生成。最もクライアントに刺さるが準備コスト最大
- **(c) 他の業務系サンプル DB の日本語化**（Northwind 等）

判断タイミング: スターターテンプレートが動き出したあと、Session 4 の題材詳細を詰める段階で再検討。詳細は [decision-log.md](./decision-log.md) の ADR-007 を参照。

Current: we use **Chinook** (an English music-store dataset). A pragmatic choice because it has an official SQLite edition and doesn't need Docker.

Future options to consider:

- **(a) Japanese-localized Chinook**: reuse the schema, replace artist / album / track names with Japanese ones. AI can generate the data
- **(b) Build a fictional corporate CRM**: schema and data tailored to the client's business context, generated with AI. Lands hardest with the client but highest prep cost
- **(c) Localize a different business sample DB** (e.g. Northwind)

Decision timing: revisit after the starter template is working, when we're finalizing the Session 4 subject details. See ADR-007 in [decision-log.md](./decision-log.md).

#### 採用技術スタック / Technology stack

ローカル開発（Session 3-4）と AWS クラウド（Session 5）の対比で整理する。**コードそのものは同一**で、環境変数によって接続先を切り替える設計。

| レイヤ | ローカル（Session 3-4） | AWS クラウド（Session 5） | 備考・理由 |
|--------|------------------------|---------------------------|-----------|
| 言語 | TypeScript | TypeScript | フロント・バック共通、エコシステムが豊富 |
| フロント | React + Vite（dev server） | React + Vite（ビルド成果物）→ S3 + CloudFront | 静的ホスティングで AWS 無料枠内 |
| API エンドポイント | Vite dev server からバックを直接呼ぶ or 簡易 Express | Amazon API Gateway（REST） | ローカルは薄い層で代用。API Gateway 12ヶ月無料枠（100万 req/月） |
| バック実行環境 | Node.js ローカル実行 | AWS Lambda（Container Image） | 同一コンテナイメージをローカル・クラウドで使い回せる設計。Lambda 常時無料枠（100万 req/月、400,000 GB秒/月） |
| エージェント | Claude Agent SDK | Claude Agent SDK | 同一コード。エージェントループ・ツール使用・MCP 連携がフレームワーク化されている |
| DB 接続方式 | MCP（stdio 子プロセス） | MCP（stdio 子プロセス） | 方式は共通。Lambda 内で MCP サーバーを子プロセス起動する「構成A」をローカルでも踏襲 |
| MCP サーバー | `server-sqlite`（または自作） | `@modelcontextprotocol/server-postgres` | 環境変数でサーバー実装を差し替え。研修の学習価値が高い標準プロトコル |
| DB | SQLite + `better-sqlite3` + Chinook（`.db` ファイル配布） | Amazon RDS for PostgreSQL（db.t4g.micro）+ Chinook | Docker 不要、全 OS で `npm install` のみで動作。RDS 12ヶ月無料枠（750時間/月）。Chinook は両エンジン対応 |
| 会話履歴ストア | JSON ファイル or インメモリ | Amazon DynamoDB（オンデマンド、TTL） | DynamoDB 常時無料枠（25GB + 25 RCU/WCU）。ストアを差し替える抽象化がローカル→クラウドの学びになる |
| LLM | Amazon Bedrock Claude / Anthropic Claude API | Amazon Bedrock Claude / Anthropic Claude API | 同一。環境変数で切替可。初期 AWS アカウントで Bedrock TPS=0 の場合に備え両対応 |
| シークレット管理 | `.env` ファイル（`.gitignore`）| AWS Secrets Manager | 参照方法はアプリ側で抽象化。セキュリティ観点の教材にもなる |
| IaC | 不要（ローカル実行） | Terraform | PR #1 の継続性、AWS 標準的選択 |
| 無料枠の扱い | 追加コストなし（完全ローカル） | AWS 12ヶ月無料枠 + 常時無料枠の範囲内 | LLM のみ従量課金（研修全体で数十ドル規模想定）は割り切り |

**補足**

- LLM 呼び出しは従量課金のため完全無料にはならないが、Bedrock / Claude API の従量課金（研修全体で数十ドル規模想定）は割り切る
- プロンプトキャッシュを活用し LLM コストを抑える
- 「ローカルとクラウドで差し替わる行（MCP サーバー、DB、会話履歴ストア、シークレット管理、IaC）」が**学習の主要ポイント**。「同じ行（言語、エージェント、LLM）」は環境非依存で動く設計の証拠になる

#### ローカル DB に SQLite を採用する理由 / Why SQLite for local development

##### 日本語

受講者の PC はクライアント提供の Windows が前提。Docker を必須にすると WSL2 / Docker Desktop のセットアップが重く、受講者が詰まる可能性が高い。そのためローカル開発では Docker を前提にしない方針とし、代替として **SQLite + `better-sqlite3`** を採用する（全 OS で `npm install` のみで動く、追加のインストール不要）。

**PostgreSQL（本番）との差分は研修題材では軽微**

- Chinook は OLAP 的な参照中心のデータセットで、SQLite と PostgreSQL で挙動差が出る機能（同時書き込み、高度な型、高度なトランザクション）を使わない
- 日付関数は一部違う（SQLite: `strftime` / PostgreSQL: `TO_CHAR`）が、**エージェント（LLM）に「接続中の DB 種別」を伝えれば自動で吸収される**
- SQL は共通サブセット（`LIMIT` / `WHERE` / `JOIN` / 集計関数 / CTE）に寄せる方針
- MCP サーバーを差し替える設計にすれば、アプリ本体のコードは変更不要

**ローカル → クラウドでエンジンが変わること自体が学びになる**

- 第5回の AWS デプロイ時に PostgreSQL へ切り替える
- 「なぜローカルとクラウドで DB エンジンが違ってもアプリは動くのか」を題材に、MCP による抽象化・SQL の共通サブセット設計・クライアントライブラリの抽象化を議論する

**具体的な構成**

- ローカル: `better-sqlite3` + Chinook の SQLite 版 `.db` ファイル（リポジトリ同梱 or 配布）
- ローカル MCP: SQLite 用 MCP サーバー（既存パッケージ or 自作）
- クラウド: RDS for PostgreSQL + Chinook の PostgreSQL 版スキーマ
- クラウド MCP: `@modelcontextprotocol/server-postgres`
- アプリコードは環境変数で MCP サーバー接続先を切り替える

**Docker は optional な発展オプション**

- Docker が使える受講者は Docker Compose で PostgreSQL を立ててもよい
- ただし研修の公式手順は SQLite ベースとし、Docker 版は「発展オプション」として副資料に退避

##### English

Participant PCs are client-provided Windows machines. Requiring Docker would impose heavy WSL2 / Docker Desktop setup and strand participants, so we explicitly **do not** require Docker for local development. Instead we use **SQLite + `better-sqlite3`** (every OS can run it after `npm install`, no extra installs required).

**The diff vs. PostgreSQL (production) is small for our training subject**

- Chinook is a read-oriented, OLAP-ish dataset — it doesn't exercise the things SQLite and PostgreSQL disagree on (concurrent writes, exotic types, advanced transactions)
- Some date functions differ (SQLite: `strftime` / PostgreSQL: `TO_CHAR`) but **the agent (LLM) absorbs that automatically once it's told which DB is connected**
- SQL is kept within the common subset (`LIMIT` / `WHERE` / `JOIN` / aggregates / CTEs)
- Swapping the MCP server hides engine differences from the app code

**Changing engines from local to cloud is itself a learning moment**

- In Session 5 the app switches to PostgreSQL during the AWS deploy
- Use "why does the same app still work on a different DB engine?" as a teaching hook for MCP abstraction, the common SQL subset, and client-library abstraction

**Concrete setup**

- Local: `better-sqlite3` + Chinook's SQLite `.db` file (shipped in the repo or distributed)
- Local MCP: SQLite MCP server (existing package or custom)
- Cloud: RDS for PostgreSQL + the Chinook PostgreSQL schema
- Cloud MCP: `@modelcontextprotocol/server-postgres`
- The app switches between MCP servers via environment variables

**Docker is an optional stretch path**

- Participants who can run Docker may spin up PostgreSQL via Docker Compose
- But the official training path is SQLite; the Docker variant is kept in a separate stretch-track doc

#### MCP の段階的学習 / Progressive MCP learning

MCP を「何となく使える」ではなく「仕組みがわかって使える」レベルで習得できるよう、以下のように段階的に組み込む（各回への具体的な割り当ては全体整理後に確定）。

- **概念の導入（第1回 / Session 1）**
  - MCP が LLM と外部ツール／データソースをつなぐ標準プロトコルであることを座学で説明
  - 既存 MCP サーバー（filesystem, github 等）を Claude Code から利用するハンズオン
- **MCP 経由の DB アクセス実装（第3回 or 第4回）**
  - PostgreSQL MCP サーバーをローカルで起動し、Claude Code から接続
  - 自作エージェント（Agent SDK + TypeScript）に MCP 接続を組み込む
- **カスタム MCP サーバーの作成（第4回 or 発展課題）**
  - 既存 MCP サーバーで足りない機能を自作する（例: Chinook データに対する可視化ツール）
  - MCP プロトコル仕様の理解
- **クラウド環境での MCP 運用（第5回）**
  - Lambda 内で MCP サーバーを子プロセスとして起動する構成の実装
  - stdio 方式（子プロセス起動、標準入出力通信）の仕組みを実装レベルで理解

#### 今後追加予定の要素 / To be added later

研修の厚みを出すために、以下の要素も今後組み込む検討をする（各要素がどのセッションにハマるかは整理中）。

- **Hooks**: Claude Code の Hooks 機能で、ツール呼び出し前後の自動処理や安全装置を受講者に体験させる
- **Skills**: 再利用可能な Skill として、研修中に作った手順を Claude Code に覚えさせる流れを入れる
- **Rules**: プロジェクト固有のルール（CLAUDE.md 等）で AI の振る舞いを制御する考え方を紹介する
- （TBD: 他に追加したい要素があれば随時）

#### 参照アーキテクチャ図 / Reference architecture diagrams

- 参照アーキテクチャ図（Session 3–5 共通のアプリケーション構成）: [docs/architecture/reference-architecture.drawio](../docs/architecture/reference-architecture.drawio)
- RDS インフラ構成図（PostgreSQL 版、Session 5 のクラウド構成の一部）: [docs/architecture/rds-infrastructure.drawio](../docs/architecture/rds-infrastructure.drawio)

### English

- With the goal of reaching a "prototype running in the cloud" in Session 5, proceed from Session 3 onward with a **cloud-releasable architecture** as a premise
- Prepare the following training content in advance
  - Reference architecture diagram (structure from local development through cloud deployment)
  - Starter template / project skeleton (ready so participants can start immediately in Session 3)
  - The adopted technology stack (frontend / backend / DB / hosting, etc.) and the rationale for each choice
  - Deployment procedure / IaC / CI/CD scaffolding (to enable a smooth transition in Session 5)
- Intent: Ensure that the trial-and-error during Sessions 3 and 4 does not cause rework when moving to the cloud in Session 5

#### Subject matter

- A conversational agent application whose subject is **natural language → SQL → visualization / insights**
- Participants build a simple agent application (a chat UI that queries a database)
- Exactly which of Sessions 3–5 this maps to is decided separately after the overall layout (tentatively: Session 3 = skeleton, Session 4 = real MCP connection, Session 5 = cloud)

#### Technology stack

Organized as a side-by-side comparison of local development (Sessions 3-4) and AWS cloud (Session 5). **The application code itself is identical**; environment variables switch the endpoints.

| Layer | Local (Sessions 3-4) | AWS Cloud (Session 5) | Notes / rationale |
|-------|----------------------|------------------------|-------------------|
| Language | TypeScript | TypeScript | Shared across frontend and backend, rich ecosystem |
| Frontend | React + Vite (dev server) | React + Vite (build output) → S3 + CloudFront | Static hosting stays within the AWS free tier |
| API endpoint | Called directly from the Vite dev server, or a thin Express layer | Amazon API Gateway (REST) | Locally a thin shim substitutes for API GW. API Gateway 12-month free tier (1M req/month) |
| Backend runtime | Node.js locally | AWS Lambda (Container Image) | Same container image runs in both places. Lambda always-free tier (1M req/month, 400,000 GB-s/month) |
| Agent | Claude Agent SDK | Claude Agent SDK | Identical code. Frameworks the agent loop, tool use, and MCP integration |
| DB access pattern | MCP (stdio child process) | MCP (stdio child process) | Same pattern. The "configuration A" (Lambda spawns the MCP server as a stdio child) is followed locally too |
| MCP server | `server-sqlite` (or custom) | `@modelcontextprotocol/server-postgres` | Swapped via environment variable. High training value as a standard protocol |
| DB | SQLite + `better-sqlite3` + Chinook (shipped as a `.db` file) | Amazon RDS for PostgreSQL (db.t4g.micro) + Chinook | No Docker needed; every OS works after `npm install`. RDS 12-month free tier (750 h/month). Chinook ships for both engines |
| Conversation history | JSON file or in-memory store | Amazon DynamoDB (on-demand, with TTL) | DynamoDB always-free tier (25 GB + 25 RCU/WCU). Swapping the store is itself a local-to-cloud learning moment |
| LLM | Amazon Bedrock Claude / Anthropic Claude API | Amazon Bedrock Claude / Anthropic Claude API | Identical, switched via environment variable. Dual-supported because initial AWS accounts may have Bedrock TPS=0 |
| Secret management | `.env` file (in `.gitignore`) | AWS Secrets Manager | The lookup is abstracted on the app side. Also a teaching point for security |
| IaC | Not needed (local runs) | Terraform | Continuity from PR #1 and a standard choice on AWS |
| Free-tier handling | No extra cost (fully local) | Within AWS 12-month + always-free tiers | Only the LLM is pay-as-you-go (expected to be on the order of tens of dollars per full training) |

**Notes**

- LLM calls are billed per token so a fully free setup is not possible; accept the Bedrock / Claude API spend (~tens of dollars total) as a tradeoff
- Use prompt caching to keep LLM costs down
- The rows that **change between local and cloud** (MCP server, DB, conversation store, secret management, IaC) are the **primary learning points**. The rows that **stay the same** (language, agent, LLM) are evidence that the design is environment-agnostic

#### Progressive MCP learning

Integrate MCP in stages so participants reach a "I understand how it works" level rather than "I sort of used it". The precise session assignment is decided after the overall structure is laid out.

- **Concept introduction (Session 1)**
  - Explain via lecture that MCP is a standard protocol connecting LLMs to external tools / data sources
  - Hands-on: use existing MCP servers (filesystem, github, etc.) from Claude Code
- **Implementing DB access through MCP (Session 3 or 4)**
  - Run a PostgreSQL MCP server locally and connect to it from Claude Code
  - Wire an MCP connection into a custom agent (Agent SDK + TypeScript)
- **Building a custom MCP server (Session 4 or as an extension)**
  - Implement a feature missing from existing MCP servers (e.g. a visualization tool for Chinook data)
  - Build understanding of the MCP protocol spec
- **Operating MCP in the cloud (Session 5)**
  - Implement the pattern where the Lambda spawns the MCP server as a child process
  - Understand the stdio transport (child process + stdin/stdout) at an implementation level

#### To be added later

Elements we still want to weave in to add depth (session assignment TBD):

- **Hooks**: Let participants experience Claude Code's Hooks — automated pre/post-tool-call behavior and safety rails
- **Skills**: Include a flow where participants capture procedures they built during training as reusable Skills in Claude Code
- **Rules**: Introduce the idea of controlling AI behavior through project-specific rules (e.g. CLAUDE.md)
- (TBD: add more as they come up)

#### Reference architecture diagrams

- Reference architecture (application structure shared across Sessions 3–5): [docs/architecture/reference-architecture.drawio](../docs/architecture/reference-architecture.drawio)
- RDS infrastructure (PostgreSQL edition, part of the Session 5 cloud setup): [docs/architecture/rds-infrastructure.drawio](../docs/architecture/rds-infrastructure.drawio)
