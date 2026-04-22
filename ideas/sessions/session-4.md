# Session 4: AI駆動開発実践② 〜 プロトタイプの機能改善（エージェントの本質）

> **ステータス / Status**: 骨格作成中 / Skeleton in progress
> **関連 / Related**: [initial-ideas.md の Session 4 記述](../initial-ideas.md)、[decision-log.md](../decision-log.md)
>
> このファイルは `ideas/initial-ideas.md` の Session 4 記述を起点に、「研修本番で受講者に届けるもの」から逆算して研修コンテンツ制作のためのタスク設計を行う場所。
> Starting from the Session 4 description in `ideas/initial-ideas.md`, this file reverse-engineers what we ship to participants into a concrete content-production task design.

---

## 1. このセッションで受講者に届けるもの（成果物）/ What we deliver to participants

### 事前（セッション前）/ Before the session

- [ ] **Session 3 末尾で配布済みの宿題アナウンス**: PostgreSQL / SQLite MCP サーバーパッケージの事前取得、対話履歴のイメージ
- [ ] **MCP サーバー事前インストール手順書**: `npm install` で必要パッケージを追加する手順
- [ ] **エージェントが複数クエリを統合する仕組みの概観資料**（事前に目を通せる形）

### 当日（セッション中）/ During the session

- [ ] **スライド（PPTX）**:
  - Session 4 のゴール提示
  - MCP サーバー / MCP クライアントの役割分担（stdio 通信の実態）
  - Chinook に対する「総合的に回答」のユースケース紹介
    - 例: 「セールスNo.1 の従業員とその売り上げに占めるレコードの種類は？」
    - エージェントが自律的に計画→複数クエリ→統合する様子を図解
  - 会話履歴の持たせ方（ローカル: JSON or in-memory / クラウド: DynamoDB）
  - **Hook を自分で書くハンズオン**の進め方
    - Hook 3（PreToolUse で `.env` / 秘密ファイル読み込み警告）の仕様
  - **Permissions を自分で追記するハンズオン**の進め方
    - DB 破壊系クエリ（DROP、TRUNCATE 等）の deny 設計
  - SQL インジェクション対策（層1）: MCP が隠蔽する領域 vs 自分で担保すべき領域
  - 会話履歴に機密を入れない設計
  - （発展）カスタム MCP サーバー自作の紹介
- [ ] **「総合的に回答」の問いサンプル集**: 受講者が Session 4 中に試す問いのリスト
  1. セールスNo.1 の従業員とその売上に占めるレコード種類
  2. 売上上位 3 カテゴリと、それぞれの主要顧客
  3. リピート率の高い顧客と好む商品の傾向
  4. 配送遅延が多い配送業者と影響を受けた商品カテゴリ
  5. (その他、受講者が自分で考える問いも歓迎)
- [ ] **Hook 3（`.env` 読み込み警告）の仕様書**: 受講者が実装するための要件
- [ ] **Hook 3 のリファレンス実装**（講師用）: つまずいた受講者に見せる想定
- [ ] **Permissions 拡張サンプル**: DB 破壊クエリを deny する `settings.json` 断片
- [ ] **MCP サーバー差し替えガイド**: SQLite 版 → PostgreSQL 版への切替例（発展的）
- [ ] **SQL インジェクション対策の座学資料**
- [ ] **会話履歴ストアの最小実装例**（JSON ファイル or in-memory）
- [ ] **講師用進行台本**

### 事後（セッション後）/ After the session

- [ ] **次回への宿題アナウンス**: AWS アカウント準備と動作確認、AWS CLI / Terraform インストール確認、（任意）アプリの整理
- [ ] **Session 4 振り返り資料**: エージェントの本質（LLM + ツール + 履歴）の整理、次回予告（クラウドデプロイ）
- [ ] **受講者各自のアプリ（Git リポジトリ）**:
  - MCP 経由で Chinook に実接続している対話型エージェント
  - 会話履歴が残るローカルアプリ
  - 自作の Hook 3 が動いている
  - Permissions が追記されている

---

## 2. 成果物から逆算したコンテンツ構造 / Content structure reverse-engineered from deliverables

### 座学パート / Lecture part
- (TBD) 「総合的に回答」の仕組みの図解（LLM が計画 → ツール → 統合）
- (TBD) MCP サーバー / クライアントの関係（stdio 通信の実態）
- (TBD) 会話履歴の設計トレードオフ（ローカル vs クラウド、JSON vs DB）
- (TBD) SQL インジェクション対策（層1）

### ハンズオンパート / Hands-on part
- (TBD) MCP 実接続のコード追加・動作確認
- (TBD) 「総合的に回答」の問いを実際に投げる
- (TBD) Hook 3 を自分で書く → 動作確認（`.env` を読もうとしてブロック）
- (TBD) Permissions 拡張（deny 追加 → 試す）
- (TBD) 会話履歴の実装

### 相互作用パート / Interaction part
- (TBD) 問いのサンプル以外に自分で考えた問いをペアで試す
- (TBD) Hook 3 の実装でハマった人のフォロー体制

### 振り返りパート / Retrospective part
- (TBD) 「エージェント = LLM + ツール + 履歴」の実装レベル理解を言語化
- (TBD) Session 5（クラウド化）への橋渡し

---

## 3. 各コンテンツの「根拠」と「検証項目」/ Rationale and verification items

### 根拠 / Rationale
- 「総合的に回答」のユースケース: ideas 主題材の核（エージェントが複数クエリを自律的に統合）
- Hook 3（`.env` 読み込み警告）: Hooks/Skills/Permissions 組み込みマップ Session 4 の「受講者が自分で書く Hook」
- Permissions 拡張: 同マップ Session 4 の「Permissions 自分で追記」
- SQL インジェクション対策（層1）: セキュリティ 3 層構造 Session 4 のマッピング
- 会話履歴ストアの差し替え: ideas 技術スタック対比表の学びポイント

### 検証項目 / Verification
- (TBD) MCP サーバーが Windows / Mac で `npm install` 後に起動するか
- (TBD) 「総合的に回答」の問いに対してエージェントが複数クエリ実行 → 統合 を実演できるか
- (TBD) Hook 3 の仕様が受講者実装で 30 分以内に完了するか
- (TBD) Permissions の deny ルールが実際に効くか（ルール書いた後に破壊クエリを頼むとブロックされるか）
- (TBD) 会話履歴の最小実装が短時間で動くか
- (TBD) 4h の時間配分が現実的か

---

## 4. 制作タスク一覧 / Production task list

### スライド作成 / Slides
- [ ] (TBD) Session 4 全体スライド
- [ ] (TBD) 「総合的に回答」仕組みの図解スライド
- [ ] (TBD) MCP サーバー/クライアント関係スライド
- [ ] (TBD) 会話履歴設計スライド
- [ ] (TBD) Hook 3 の仕様スライド
- [ ] (TBD) Permissions 拡張スライド
- [ ] (TBD) SQL インジェクション対策スライド

### コード資産 / Code assets
- [ ] (TBD) MCP サーバー（SQLite 用）の実装または既存パッケージ特定
- [ ] (TBD) Session 3 スターターに MCP クライアント接続コードを追加
- [ ] (TBD) 会話履歴ストアの最小実装（JSON / in-memory）
- [ ] (TBD) Hook 3 のリファレンス実装
- [ ] (TBD) Permissions の拡張サンプル
- [ ] (TBD) 「総合的に回答」のサンプル問い集のキュレーション
- [ ] (TBD) カスタム MCP サーバー自作のサンプル（発展課題用）

### 配布物作成 / Handouts
- [ ] (TBD) Hook 3 仕様書
- [ ] (TBD) 「総合的に回答」の問いサンプル集
- [ ] (TBD) SQL インジェクション対策の座学資料
- [ ] (TBD) MCP サーバー差し替えガイド（発展）

### 検証 / Verification
- [ ] (TBD) 講師陣で Session 4 を通しでドライラン
- [ ] (TBD) 「総合的に回答」の問いをエージェントが解けるかの検証（複数パターン）
- [ ] (TBD) Hook 3 の実装難易度検証（初学者が 30 分で書けるか）
- [ ] (TBD) 題材データの差し替えやすさ検証（ADR-007 を意識）

---

## 5. Open Questions / TBD

- 「総合的に回答」の問いで、エージェントが期待通りの複数クエリ計画を立てるかの信頼性（LLM 依存）
- Hook 3 の仕様をどこまで厳密に決めるか（自由度が高すぎると採点しづらい）
- Permissions の DB 破壊クエリ deny は MCP 経由でのクエリに効くのか、それとも別の層で止める必要があるか
- 会話履歴を JSON ファイルにするか in-memory にするか（どちらも教材としては十分）
- カスタム MCP サーバー自作は発展で残すか、全員にやってもらうか
- SQL インジェクションの座学は MCP が前提だと実感が薄い（生 SQL を書かないので）。どう見せるか
- 4h でここまで全部やれるか（Hook 自作で詰まると時間が溶ける）
