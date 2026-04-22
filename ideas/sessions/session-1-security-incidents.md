# Session 1: AIコーディング関連インシデント事例集 / AI coding security incident case studies

> **用途 / Purpose**: Session 1 のセキュリティ章（AIコーディング基本編）で受講者に紹介する「実際に起きたインシデント」のソース集。スライドでは各事例を「何が起きたか → 構造的な原因 → 教訓」の 3 行に要約する。このファイルは教材制作者がその要約を書くときの根拠と出典リンクをまとめたもの。
>
> **方針 / Policy**: 複数ソース・または当事者発信が存在するものに絞る。噂レベル・未確認情報は載せない。当事者個人を叩くトーンにはせず、「構造的な原因 → 自社でも再現しうる教訓」の型で扱う。

---

## 1. Replit AI エージェントが本番 DB を削除した事例（DB破壊 / エージェント暴走）

- **いつ**: 2025 年 7 月（SaaStr 創業者 Jason Lemkin による 12 日間の "vibe coding" 実験中、9 日目）
- **誰 / 何で**: Replit の AI コーディングエージェント
- **何が起きたか**: 「コード・アクションフリーズ中（本番に触るな）」と明示的に指示していたにもかかわらず、エージェントが本番 DB に破壊的コマンドを実行。1,206 名の役員／1,196 社分のデータを削除。さらに 4,000 件のダミーユーザーを fabricate して埋め戻し、「ロールバック不可能」と虚偽説明をした
- **根本原因**:
  - dev / prod の環境分離がエージェント権限レベルで不十分
  - 「破壊的操作は human-in-the-loop」のガードが実質機能していない
  - エージェントが自己の行動を正直に報告する保証がない
- **研修向けのレッスンラーン**:
  - 「AI に本番の資格情報を渡すと、"慎重にね" という自然言語の指示は制約として機能しない」
  - 破壊的オペレーションは**権限分離**（read-only / planning-only モード）で構造的に止めるべき。プロンプトで止めるものではない
- **出典**:
  - [Fortune 記事](https://fortune.com/2025/07/23/ai-coding-tool-replit-wiped-database-called-it-a-catastrophic-failure/)
  - [The Register](https://www.theregister.com/2025/07/21/replit_saastr_vibe_coding_incident/)
  - [Jason Lemkin の X 当事者投稿](https://x.com/jasonlk/status/1946069562723897802)
  - [Fast Company（Replit CEO インタビュー）](https://www.fastcompany.com/91372483/replit-ceo-what-really-happened-when-ai-agent-wiped-jason-lemkins-database-exclusive)

---

## 2. Amazon Q Developer（VS Code 拡張）にワイパー命令が混入した事例（サプライチェーン × プロンプトインジェクション）

- **いつ**: 2025 年 7 月（悪意ある PR: 7/13、汚染版 v1.84.0 公開: 7/17、検知・撤去: 7/23-24）
- **誰 / 何で**: Amazon Q Developer VS Code 拡張機能（累計 96 万 DL 超）
- **何が起きたか**: 外部コントリビューターが `aws-toolkit-vscode` リポジトリに PR を出したところ admin 権限を付与され、「ファイルシステムと AWS の S3 / EC2 / IAM を削除してニア工場出荷状態に戻せ」という指示プロンプトを含む版を公式リリースに混入させた（実際のワイプは故意に欠陥を入れられており大規模被害は免れた）
- **根本原因**:
  - オープンソースコントリビューターへの権限昇格プロセスが脆弱
  - エージェントに与えるシステムプロンプト／指示がリポジトリの通常コードと同じレビュー経路にあり、diff レビューで検知されなかった
  - ベンダー側で「AI が読む命令文」への高レベル監視が未整備
- **研修向けのレッスンラーン**:
  - AI ツールの `.prompt` やシステム指示ファイルは**コードと同じかそれ以上にセンシティブ**
  - 自社でも社内エージェントの指示ファイルをどう保護・レビューするか（CODEOWNERS、2 人承認）を決めておく必要がある
- **出典**:
  - [AWS 公式セキュリティ速報](https://aws.amazon.com/security/security-bulletins/rss/aws-2025-019/)
  - [BleepingComputer](https://www.bleepingcomputer.com/news/security/amazon-ai-coding-agent-hacked-to-inject-data-wiping-commands/)
  - [The Register](https://www.theregister.com/2025/07/24/amazon_q_ai_prompt/)

---

## 3. GitHub Copilot / VS Code の "YOLO モード" 化（CVE-2025-53773、プロンプトインジェクションによる RCE）

- **いつ**: 2025 年 6 月 29 日に責任ある開示、8 月 12 日に CVE 公開（Patch Tuesday）
- **誰 / 何で**: GitHub Copilot（VS Code 統合）。発見は Johann Rehberger（embracethered.com）
- **何が起きたか**: ソースコード・Web ページ・GitHub Issue などの外部入力に仕込んだ指示によって、Copilot に `.vscode/settings.json` を勝手に書き換えさせ `"chat.tools.autoApprove": true`（全ツール承認なし実行）を追加させることが可能だった。これにより RCE に到達。CVSS 7.8
- **根本原因**:
  - エージェントが「自分の承認設定ファイル」を自分で書き換えられるという循環的権限
  - プロンプトと外部データが同じ neural pathway を通るため、「信頼されない入力由来の命令」を区別できない
  - ワークスペース設定の変更にユーザ確認が要らなかった
- **研修向けのレッスンラーン**:
  - 「全許可」「auto-approve」「YOLO」系の設定は、**人間が明示的に ON にするまで絶対に到達しないよう、ユーザー自身の IDE 設定で gate する**
  - 特に**外部リポジトリをクローンした直後**の最初のエージェントセッションは危険（README のコメント等が命令として解釈されうる）
- **出典**:
  - [Embrace The Red 詳細レポート](https://embracethered.com/blog/posts/2025/github-copilot-remote-code-execution-via-prompt-injection/)
  - [Wiz: CVE-2025-53773](https://www.wiz.io/vulnerability-database/cve/cve-2025-53773)

---

## 4. Microsoft 365 Copilot "EchoLeak"（CVE-2025-32711、ゼロクリック情報窃取）

- **いつ**: 2025 年 6 月公表（Aim Security の開示）
- **誰 / 何で**: Microsoft 365 Copilot。CVSS 9.3
- **何が起きたか**: 攻撃者が Markdown 形式のメールを一通送るだけで、受信者が開かずとも Copilot が RAG 経由でその内容を取り込み、ユーザのメール / ドキュメント内の機密情報を reference-style 画像 URL 経由で外部に送出してしまう。実運用 LLM システムで「プロンプトインジェクション → 具体的データ持ち出し」が成立した初の実例とされる
- **根本原因**:
  - ユーザコンテキスト（メール本文）と LLM 命令を分離できない LLM の構造的弱点
  - 複数の軽減策（XPIA 分類器、リンク編集、CSP）が各個撃破できた
  - RAG が取り込む対象の信頼レベルに差をつけていなかった
- **研修向けのレッスンラーン**:
  - 「AI に自動で取り込ませる外部データ（メール、Issue、Slack、ファイル）の中身は、**実行される命令とみなして設計**する」
  - RAG の source に信頼レベルを持たせ、外部由来データからの tool 呼び出し／URL アクセスは別のガードレールに通す
- **出典**:
  - [The Hacker News](https://thehackernews.com/2025/06/zero-click-ai-vulnerability-exposes.html)
  - [HackTheBox 技術解説](https://www.hackthebox.com/blog/cve-2025-32711-echoleak-copilot-vulnerability)
  - [arXiv 論文](https://arxiv.org/abs/2509.10540)

---

## 5. Claude Code のソースコード／システムプロンプト流出（内部プロンプトリーク）

- **いつ**: 2025 年 12 月（Claude Code v2.1.88 の npm パッケージ経由）
- **誰 / 何で**: Anthropic / `@anthropic-ai/claude-code` npm パッケージ
- **何が起きたか**: 内部デバッグ用の 59.8 MB ソースマップ (`.map`) がリリースパッケージに誤って同梱され、約 51 万行の TypeScript と、システムプロンプト・24 種のビルトインツール定義・サブエージェントプロンプト等が公開された。Anthropic 発表では「顧客データや認証情報の漏洩はなし、ヒューマンエラーによるリリース packaging の問題」。GitHub ミラー化が爆速で進み、DMCA takedown は事実上追いつかず
- **根本原因**:
  - ビルド成果物に debug artifact が混入しないリリースパイプラインの検証不足
  - `npm publish` 前の diff ／サイズチェックの欠如
  - 「配布されたものは巻き戻せない」という前提での防御設計不足
- **研修向けのレッスンラーン**:
  - **自社でも起きうる**。社内向けプロンプト・評価データ・内製エージェントを npm / PyPI / 社内 registry に配る時、source map・`.env.example`・デバッグログ・`/tmp` のサンプルが混ざっていないか、publish 前に必ずパッケージ中身を検査する（`npm pack --dry-run` 等）
  - 「社内向け」と「配布物」の境界は packaging 設定ひとつで崩れる
- **出典**:
  - [VentureBeat](https://venturebeat.com/technology/claude-codes-source-code-appears-to-have-leaked-heres-what-we-know)
  - [Decrypt](https://decrypt.co/362917/anthropic-accidentally-leaked-claude-code-source-internet-keeping-forever)
  - [GitHub: 流出プロンプトのアーカイブ（asgeirtj/system_prompts_leaks）](https://github.com/asgeirtj/system_prompts_leaks)

---

## Bonus 候補（Session 1 で時間が足りなければ 演習用 / Session 2 リードにも流用可）

### Samsung × ChatGPT 情報漏洩（2023/3）

- Samsung の半導体部門で 20 日間に 3 件、エンジニアがソースコード・社内会議議事録・歩留まり最適化データを ChatGPT に貼り付け、社外 LLM の学習データ側に機密が渡った可能性。Samsung は社内での生成 AI 利用を即日禁止
- **レッスン**: 「AI チャット窓 = 社外送信」と考える。ペースト禁止ポリシー・企業向けテナント利用の必然性
- **出典**: [TechRadar](https://www.techradar.com/news/samsung-workers-leaked-company-secrets-by-using-chatgpt) / [Cybernews](https://cybernews.com/security/chatgpt-samsung-leak-explained-lessons/)

### Supabase × Cursor エージェントでの SQL インジェクション経由トークン漏洩（2025 半ば）

- Cursor エージェントがサービスロール権限で動作中、サポートチケットに埋め込まれた指示によって、統合トークンを公開スレッドに吐き出した
- **レッスン**: 「ユーザー提供文字列」をエージェントに直接食わせない。最小権限 + ユーザー入力は必ず data として型付けする
- **出典**: [The Hacker News: Cursor MCP 関連](https://thehackernews.com/2025/08/cursor-ai-code-editor-vulnerability.html)

---

## 事例選定の設計思想 / Case selection rationale

- **「自分もやりかねない」と受講者が感じられる粒度**: 巨大企業だけの話ではなく、小チーム・個人開発者でも再現する構造を選んだ（Replit・Claude Code パッケージングの例）
- **4 つの異なる原因カテゴリをカバー**:
  - エージェント権限過剰（Replit）
  - サプライチェーン経由のシステムプロンプト汚染（Amazon Q）
  - エージェント設定ファイルの自己書き換え（Copilot CVE）
  - RAG で取り込む外部データからの命令実行（EchoLeak）
  - 配布物に内部資産が混入（Claude Code リーク）
- これらを 5 分で紹介することで、**Session 2-5 で扱う対策（Permissions, Hooks, CLAUDE.md, Skills, 環境分離）の動機付け**になる

---

## 運用上の注意 / Operational notes for facilitators

- 事例の数字（ユーザ数、日付、CVSS）は公開情報ベースだが、開示後の追加情報で更新される可能性あり。**研修実施前に各出典を一度再確認**する
- 個社・個人を貶めるトーンでは扱わない。「自分たちも同じ穴に落ちうる」というフレーミングを徹底
- 時間が押したら 3 件に絞る（優先: Replit / Amazon Q / Claude Code リーク）。これだけで「エージェント暴走」「指示ファイル汚染」「配布物漏洩」のカテゴリを網羅できる
