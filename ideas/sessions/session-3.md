# Session 3: AI駆動開発実践① 〜 プロトタイプによる事業アイディア具体化

> **ステータス / Status**: 骨格作成中 / Skeleton in progress
> **関連 / Related**: [initial-ideas.md の Session 3 記述](../initial-ideas.md)、[decision-log.md](../decision-log.md)、[参照アーキテクチャ](../../docs/architecture/reference-architecture.drawio)
>
> このファイルは `ideas/initial-ideas.md` の Session 3 記述を起点に、「研修本番で受講者に届けるもの」から逆算して研修コンテンツ制作のためのタスク設計を行う場所。
> Starting from the Session 3 description in `ideas/initial-ideas.md`, this file reverse-engineers what we ship to participants into a concrete content-production task design.

---

## 1. このセッションで受講者に届けるもの（成果物）/ What we deliver to participants

### 事前（セッション前）/ Before the session

- [ ] **Session 2 末尾で配布済みの宿題アナウンス**: Node.js インストール確認、SQL の初歩復習
- [ ] **SQL の初歩参考資料**（未経験者向け）: リンク集 + Chinook スキーマの概観
- [ ] **研修用スターターテンプレートの存在予告**（任意）: 「次回は雛形から始める」程度

### 当日（セッション中）/ During the session

- [ ] **スライド（PPTX）**:
  - Session 3 のゴール提示
  - 参照アーキテクチャ図の説明（ローカル ↔ AWS クラウド対比表）
  - 技術スタックの説明（TypeScript / Vite / Claude Agent SDK / MCP / SQLite / etc.）
  - **AI ガードレール 4 仕組みの「スターター内蔵」説明**
    - Permissions の allow/deny 例示
    - Hook 1（機密書き込みブロック）、Hook 2（危険コマンドブロック）の説明
    - CLAUDE.md（Memory）の役割と「忘れられうる」限界
    - Skills のサンプル
  - MCP の「使う側」の視点（Session 4 予告として「自分で書く側」も）
  - セッション内の進め方（スターターから始める→チャット UI→ 最小エージェント）
- [ ] **スターターテンプレート（Git リポジトリ）**: 第3回で即着手できる状態
  - `package.json`, `tsconfig.json`, `vite.config.ts` 等の標準ファイル
  - `src/` 配下にチャット UI + Agent SDK + MCP クライアント呼び出しの最小骨格
  - `.claude/settings.json`（Permissions + Hooks）
  - `CLAUDE.md`（プロジェクト固有の知識・指示）
  - `.claude/skills/` にサンプル Skill 1 つ
  - `chinook.db`（SQLite 版の Chinook）同梱 or 取得手順
  - `README.md`（セットアップ手順、トラブルシューティング）
- [ ] **参照アーキテクチャ図（実物）**: ローカル ↔ AWS クラウド対比版
- [ ] **技術スタック対比表**（スライド内 or 別資料）
- [ ] **ガードレール体験のデモ手順**: 講師が実演する「Permissions が効く」「Hook が止める」のステップ
- [ ] **Chinook サンプルデータの取り扱いガイド**: `.db` ファイルの位置、スキーマ概観、典型的なクエリ例
- [ ] **`better-sqlite3` のビルドが失敗した時のトラブルシューティング資料**（Windows 一般向け。Workspaces 等特定環境固有の検証は別 Issue / Findings に切り出す）
- [ ] **講師用進行台本**

### 事後（セッション後）/ After the session

- [ ] **次回への宿題アナウンス**: PostgreSQL MCP サーバーのパッケージ事前取得、対話履歴のイメージ考案
- [ ] **Session 3 振り返り資料**: 今日動かしたスターター構造の全体像、次回予告（MCP 実接続）
- [ ] **受講者各自のプロトタイプ（Git リポジトリ）**: ローカルで動くチャット UI + 最小エージェント

---

## 2. 成果物から逆算したコンテンツ構造 / Content structure reverse-engineered from deliverables

### 座学パート / Lecture part
- (TBD) 参照アーキテクチャ図の 1 スライドでの見せ方
- (TBD) 技術スタック表の読み方と、「同一 / 差し替え」の視点
- (TBD) AI ガードレール 4 仕組みの一気見せから実演への遷移
- (TBD) CLAUDE.md の「忘れられうる」を示す実演例（長い会話を見せる）

### ハンズオンパート / Hands-on part
- (TBD) スターターをクローン → `npm install` → `npm run dev` で起動するまで
- (TBD) Permissions が効く体験（禁止操作を AI に頼む → ブロック）
- (TBD) Hook が効く体験（機密情報っぽい文字列を AI に書かせようとする → Hook で止まる）
- (TBD) チャット UI を動かして AI に話しかける（ただし Session 3 段階では固定応答 or 最小のエージェント応答）
- (TBD) サンプル Skill の動作確認

### 相互作用パート / Interaction part
- (TBD) ガードレール体験で「自分もやってみる」時間
- (TBD) スターターの構造を読み解く（CLAUDE.md や settings.json を皆で読む）

### 振り返りパート / Retrospective part
- (TBD) Session 2 のバイブコーディングとの対比を言語化
- (TBD) 「スターターがあると速い」の実感共有
- (TBD) 次回（MCP 実接続）への期待値醸成

---

## 3. 各コンテンツの「根拠」と「検証項目」/ Rationale and verification items

### 根拠 / Rationale
- スターターテンプレート: ideas 共通方針「第3回で即着手できる雛形」を実装したもの
- Permissions / Hooks / CLAUDE.md / Skills のスターター内蔵: ideas「Hooks/Skills/Permissions 組み込みマップ」Session 3 列
- 参照アーキテクチャ図の対比表: 共通方針「技術スタック表」の可視化
- Chinook SQLite 版: ADR-004（SQLite へ切替）、ADR-007（Chinook 維持）

### 検証項目 / Verification
- (TBD) スターターのクローン〜起動が一般的な Windows / Mac のクライアント提供 PC で詰まらないか
- (TBD) `better-sqlite3` のビルドが Windows で通るか
- (TBD) Permissions / Hooks のサンプルが意図通り効くか
- (TBD) CLAUDE.md の「忘れられる」を短い時間で再現できるか
- (TBD) 4h の時間配分で全員がローカル動作に到達するか

---

## 4. 制作タスク一覧 / Production task list

### スターターテンプレート / Starter template
- [ ] (TBD) リポジトリ雛形の構造設計（ディレクトリ構成、ファイル命名）
- [ ] (TBD) `package.json` / `tsconfig.json` / `vite.config.ts` の作成
- [ ] (TBD) チャット UI の最小実装（React + Vite）
- [ ] (TBD) Agent SDK + MCP クライアント呼び出しの最小骨格
- [ ] (TBD) `.claude/settings.json` の Permissions 設計
- [ ] (TBD) Hook 1（機密書き込みブロック）の実装
- [ ] (TBD) Hook 2（危険コマンドブロック）の実装
- [ ] (TBD) サンプル Skill の作成
- [ ] (TBD) CLAUDE.md の書き方（知識 + 指示）
- [ ] (TBD) README.md（セットアップ・トラブルシューティング）
- [ ] (TBD) Chinook `.db` 同梱 or 取得スクリプト

### スライド作成 / Slides
- [ ] (TBD) Session 3 全体スライド
- [ ] (TBD) 参照アーキテクチャ図スライド
- [ ] (TBD) 技術スタック対比表スライド
- [ ] (TBD) AI ガードレール 4 仕組み紹介スライド
- [ ] (TBD) ガードレール体験デモの導線

### 配布物作成 / Handouts
- [ ] (TBD) 参照アーキテクチャ図（印刷用 / 電子版）
- [ ] (TBD) 技術スタック対比表（受講者用の早見表）
- [ ] (TBD) Chinook スキーマ概観（ER 図 + テーブル解説）
- [ ] (TBD) ガードレール体験のステップガイド（受講者用）
- [ ] (TBD) `better-sqlite3` ビルド失敗時のトラブルシューティング資料

### 検証 / Verification
- [ ] (TBD) 講師陣でスターターを動かすドライラン
- [ ] (TBD) `better-sqlite3` が Windows 一般環境でビルドできるか検証（Workspaces 等特定環境は別 Issue）
- [ ] (TBD) Permissions / Hooks / CLAUDE.md / Skills が意図通りに動くか検証
- [ ] (TBD) 4h の時間配分での通し検証

---

## 5. Open Questions / TBD

- スターターテンプレートのレベル感（どこまで動く状態で配布するか。「すでに動くチャット UI」か「動くが応答は固定」か）
- Chinook の `.db` ファイルをリポジトリに同梱するか、取得スクリプトにするか（サイズ次第）
- ガードレール体験の実演時間（全員同時にやる？講師デモ後に各自？）
- Session 3 のゴール粒度（「チャット UI が立ち上がる」で十分か、「単発質問に対する最小応答まで」か）
- 受講者が自分で CLAUDE.md を書く時間をとるか（ここは Session 4 に持ち越すか）
- スターターの MCP 接続は Session 3 段階でどこまで入っているか（stdio 起動のコード骨格は入れる？接続は Session 4？）
