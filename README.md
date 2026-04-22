TEST EDIT

# aidd-training-materials

AI駆動開発（AI-Driven Development）研修のデリバリー資料を管理するリポジトリ。

---

## レポジトリ概要 / Repository Overview

### 日本語

目的:
- AI駆動開発研修のデリバリーに関係する資料を管理する
- NTT Docomo様向けのトレーニングを中心としつつ、汎用的な研修資料の土台とする

### English

Purpose:
- Manage materials related to the delivery of AI-driven development training
- Center the effort on training for NTT Docomo, while using it as a foundation for general-purpose training materials

---

## 研修の目的・ゴール・アウトカム / Training Goal & Outcome

### 日本語

- **ゴール**: 受講者が AI を活用した開発（AI駆動開発）を実務で実践できるようになる
- **アウトプット**: 模擬データに対して自然言語で回答する AI エージェントアプリを、AI とのペア作業で構築し AWS にデプロイする
- **アウトカム**: AI とのペア作業を通じて、知見のない技術領域も AI の力で学びながら作り上げる経験を得て、「AI の行動を設計・制御することで安全に開発できる」という実感と自信を持つ

研修の成否は**アウトカムで判断する**。詳細・背景は [ideas/initial-ideas.md](ideas/initial-ideas.md) を参照。

### English

- **Goal**: Participants become able to practice AI-driven development in their real work
- **Output**: An AI agent application answering natural-language questions against simulated data, built in pair-programming with AI and deployed on AWS
- **Outcome**: Through pair-programming with AI, participants gain confidence that safe development is possible by designing and controlling AI's behavior

Success is judged by the **outcome**. See [ideas/initial-ideas.md](ideas/initial-ideas.md) for detail.

---

## NTT Docomo様案件に関して / About the NTT Docomo Engagement

### 担当者 / Members

- Tetsuya (AI SME)
- Ken (AI Platform Specialist)
- Rodi (AI Engineer)
- Vinamura (AI Engineer)

### リンク集 / Links

#### 日本語

- 案件内容の詳細は [Miroボード](https://miro.com/app/board/uXjVGoKTse8=/?moveToWidget=3458764666200308178&cot=14) を参照
- 題材のサンプルアプリケーションに関しては [slalomjapan-aiae-training](https://github.com/kenyoneda-slalom/slalomjapan-aiae-training) を参照

#### English

- For engagement details, see the [Miro board](https://miro.com/app/board/uXjVGoKTse8=/?moveToWidget=3458764666200308178&cot=14)
- For the sample application used as the subject, see [slalomjapan-aiae-training](https://github.com/kenyoneda-slalom/slalomjapan-aiae-training)

---

## ディレクトリ構成 / Directory Layout

```
aidd-training-materials/
├── README.md                      # 本ファイル
├── docs/                          # スライド・アーキテクチャ・運用資料
│   ├── architecture/              # アーキテクチャ図・設計資料
│   ├── session-slide-storyboards/ # セッションごとのスライド骨子
│   │   ├── session1-slides.md     # 暫定の一体版（分割予定）
│   │   └── session-1/             # 分割後の配置（セクション単位のディレクトリ）
│   │       ├── 01-opening/        #   例: セクション名は NN-<name> 形式（NNは2桁）
│   │       ├── 02-pre-survey/     #   各ディレクトリ直下にスライド1枚=1ファイル
│   │       ├── 03-concepts/       #   （例: 04-handson/fallback-guide.md）
│   │       ├── 04-handson/
│   │       └── 05-wrap-up/
│   └── surveys/                   # 事前・事後アンケートの設問仕様書（予定）
├── ideas/                         # 設計アイデア・意思決定ログ
│   ├── initial-ideas.md           # 研修全体の設計思想
│   ├── decision-log.md            # 意思決定ログ
│   ├── sessions/                  # セッションごとの設計メモ
│   └── sample-app-ideas/          # サンプルアプリのアイデア
└── iac/                           # インフラ資材（Session 5 向け）
```

### ファイル配置ルール / File Placement Rules

- **スライド骨子**: `docs/session-slide-storyboards/session-<N>/<NN>-<name>/<topic>.md`
  - セクションディレクトリは `01-opening`, `02-pre-survey`, `03-concepts`, `04-handson`, `05-wrap-up` のように `NN-<name>`（NN は 2 桁のセクション番号）形式で命名する
  - 例: [docs/session-slide-storyboards/session-1/04-handson/fallback-guide.md](docs/session-slide-storyboards/session-1/04-handson/fallback-guide.md)
  - コンフリクト回避のため、スライド1枚を1ファイルとして、セクション単位のディレクトリに配置する
  - 番号（Slide XX）をファイル名に入れない。順序はセクション内で後から調整する
- **暫定の一体スライド**: `docs/session-slide-storyboards/session<N>-slides.md`
  - 初期の通し構成版。今後セクション単位で分割していく
- **アンケート仕様書**: `docs/surveys/session<N>-<pre|post>-survey.md`
  - 設問・選択肢・Before/After対応表などの実装仕様
- **アイデア・意思決定メモ**: `ideas/` 配下
  - スライド・手順書に反映する前段階の思考・方針を置く場所

---

## Issue 運用ルール / Issue Workflow

### ラベル体系 / Labels

| カテゴリ | ラベル |
|---------|--------|
| セッション | `session-1` / `session-2` / `session-3` / `session-4` / `session-5` |
| 成果物の種類 | `slides`（スライド）/ `runbook`（手順書）/ `survey`（アンケート）/ `code`（コード資材）/ `ops`（運用物）|
| 作業種別 | `research`（調査・整理）/ `investigation`（子Issueの調査タスク）/ `findings`（環境・OS検証メモ）|
| 構造 | `parent`（親／エピックIssue）|
| 汎用 | `documentation`（ドキュメント）/ `bug` / `enhancement` / `question` 等 |

### 親 Issue と子 Issue / Parent & Child Issues

- 各セッション（#6〜#10）は **親 Issue** として起票済み
- 調査・スライド・手順書などの具体タスクは **子 Issue** として起票し、本文に `親Issue / Parent: #<num>` を記載する
- 子 Issue の受け入れ条件を満たしたら、1つの PR で対応する

### PR 運用 / PR Workflow

- **ブランチ命名**: `docs/<short-topic>` / `feat/<short-topic>` / `fix/<short-topic>` 等
  - 例: `docs/session1-fallback-guide`, `docs/readme-project-guide`
- **PR 本文**: `Closes #<num>` で Issue と紐付ける
- **レビュワー指名**: 担当メンバー（`TetsuyaNitta` / `kenyoneda-slalom` / `rodion-slalom`）から少なくとも1名を指定
- **マージ**: レビュー Approve 後にマージ

### 研修運用方針として共通化しているもの / Shared training-ops decisions

- **宿題は任意のみ**（必須の宿題は設けない）
- **受講者PCは会社支給のWindowsPCが第一前提**（Macはオプション扱い）

個別の詳細・背景は [ideas/initial-ideas.md](ideas/initial-ideas.md) および [ideas/decision-log.md](ideas/decision-log.md) を参照。
