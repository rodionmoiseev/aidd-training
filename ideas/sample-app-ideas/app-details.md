# サンプルアプリケーションアイデア / Sample Application Ideas

> **注意 / Note**: 研修の前提条件・技術要件・データセット要件については [training-prerequisites.md](./training-prerequisites.md) を参照してください。
> 
> For training prerequisites, technical requirements, and dataset requirements, please refer to [training-prerequisites.md](./training-prerequisites.md).

## 概要 / Overview

このドキュメントは、AI駆動開発研修で構築可能なサンプルアプリケーションのアイデアをまとめたものです。
各アイデアは以下の基準で評価されています:

This document summarizes sample application ideas that can be built in the AI-driven development training.
Each idea is evaluated against the following criteria:

- **プリセールスエンジニア関連性** / Pre-sales engineer relevance
- **汎用性** / Reusability across industries
- **データ入手性** / Data availability (no Kaggle login, open licenses)
- **Docker要否** / Docker requirement
- **AWS Free Tier適合性** / AWS Free Tier compatibility

---

## アイデア1: 顧客問い合わせ対応アシスタント / Customer Inquiry Response Assistant

### 日本語
**概要**: 顧客からの問い合わせをAIが分析し、回答案を生成。担当者が確認・編集して返信

**エージェントワークフロー**:
1. **分類エージェント**: 問い合わせ内容を分析し、カテゴリ・優先度・感情を判定
2. **生成エージェント**: 過去の回答履歴とFAQから適切な回答案を生成

**技術構成**:
- **FE**: React + Vite（問い合わせ一覧、回答編集画面、ダッシュボード）
- **BE**: Node.js Express + Claude Agent SDK（API、エージェント制御）
- **RDS**: PostgreSQL（問い合わせ履歴、FAQ、テンプレート）
- **追加1**: Redis - セッション管理・キャッシュ
- **追加2**: Claude API - 分類・生成

**難易度**: ★★★☆☆（中）

**メリット**:
- カスタマーサポート業務に直結
- 2ステップエージェントのデモに最適
- 日本語の自然言語処理の実例
- 段階的改善の余地が大きい（感情分析、優先度判定など）

**デメリット**:
- 初期データ（FAQ、過去の回答）の準備が必要

### English
**Overview**: AI analyzes customer inquiries and generates draft responses. Staff reviews, edits, and sends

**Agent Workflow**:
1. **Classification Agent**: Analyze inquiry content and determine category, priority, sentiment
2. **Generation Agent**: Generate appropriate response draft from past responses and FAQ

**Tech Stack**:
- **FE**: React + Vite (inquiry list, response editor, dashboard)
- **BE**: Node.js Express + Claude Agent SDK (API, agent orchestration)
- **RDS**: PostgreSQL (inquiry history, FAQ, templates)
- **Extra 1**: Redis - session management & caching
- **Extra 2**: Claude API - classification & generation

**Difficulty**: ★★★☆☆ (Medium)

**Pros**:
- Directly relevant to customer support work
- Perfect demo for 2-step agent workflow
- Real-world example of Japanese NLP
- Large room for incremental improvements (sentiment analysis, priority scoring, etc.)

**Cons**:
- Requires prep of initial data (FAQ, past responses)

---

## アイデア2: 議事録自動生成アシスタント / Meeting Minutes Assistant

### 日本語
**概要**: 会議のテキスト（または音声）をアップロードし、AIが議事録を生成・アクションアイテムを抽出

**エージェントワークフロー**:
1. **要約エージェント**: 会議内容を要約し、主要なディスカッションポイントを抽出
2. **タスク抽出エージェント**: アクションアイテム、担当者、期限を識別

**技術構成**:
- **FE**: React + Vite（テキスト入力/ファイルアップロード、議事録表示、タスク管理）
- **BE**: Node.js Express + Claude Agent SDK（API、エージェント制御）
- **RDS**: PostgreSQL（会議履歴、タスク、メンバー情報）
- **追加1**: Job Queue（Bull/Redis）- 長時間処理の非同期実行
- **追加2**: Claude API - 要約・タスク抽出

**難易度**: ★★☆☆☆（やや易）

**メリット**:
- 誰もが経験する業務シーンで共感しやすい
- テキスト処理のみで完結可能（音声はオプション）
- 結果が視覚的にわかりやすい
- 日本企業の会議文化に合致

**デメリット**:
- 音声処理を含めると複雑度が上がる
- AIの要約品質に依存

### English
**Overview**: Upload meeting text (or audio) and AI generates minutes and extracts action items

**Agent Workflow**:
1. **Summarization Agent**: Summarize meeting content and extract key discussion points
2. **Task Extraction Agent**: Identify action items, assignees, and deadlines

**Tech Stack**:
- **FE**: React + Vite (text input/file upload, minutes display, task management)
- **BE**: Node.js Express + Claude Agent SDK (API, agent orchestration)
- **RDS**: PostgreSQL (meeting history, tasks, member info)
- **Extra 1**: Job Queue (Bull/Redis) - async execution of long-running processes
- **Extra 2**: Claude API - summarization & task extraction

**Difficulty**: ★★☆☆☆ (Somewhat easy)

**Pros**:
- Relatable business scenario everyone experiences
- Can be completed with text processing only (audio is optional)
- Results are visually clear
- Aligns with Japanese corporate meeting culture

**Cons**:
- Complexity increases if audio processing is included
- Depends on AI summarization quality

---

## アイデア3: ドキュメント翻訳＆レビューシステム / Document Translation & Review System

### 日本語
**概要**: 技術文書や業務文書を日英翻訳し、品質レビューとフィードバック機能を提供

**エージェントワークフロー**:
1. **翻訳エージェント**: 元文書を翻訳（日→英 または 英→日）
2. **レビューエージェント**: 翻訳品質をチェック（専門用語の一貫性、自然さ、文脈の正確性）

**技術構成**:
- **FE**: React + Vite（文書アップロード、翻訳結果表示、差分比較、コメント機能）
- **BE**: Node.js Express + Claude Agent SDK（API、翻訳制御）
- **RDS**: PostgreSQL（文書管理、翻訳履歴、用語集）
- **追加1**: Redis - キャッシュ（同じ文書の再翻訳防止）
- **追加2**: Claude API - 翻訳・品質レビュー

**難易度**: ★★★☆☆（中）

**メリット**:
- 日本企業のグローバル化ニーズに直結
- 翻訳前後の比較が視覚的でわかりやすい
- 日英バイリンガルな参加者には特に魅力的
- 用語集機能で専門性を追加できる

**デメリット**:
- 翻訳品質の評価基準が主観的になりやすい
- 専門用語辞書の整備が必要

### English
**Overview**: Translate technical/business documents (Japanese-English), with quality review and feedback features

**Agent Workflow**:
1. **Translation Agent**: Translate source document (JP→EN or EN→JP)
2. **Review Agent**: Check translation quality (terminology consistency, naturalness, contextual accuracy)

**Tech Stack**:
- **FE**: React + Vite (document upload, translation display, diff comparison, comment feature)
- **BE**: Node.js Express + Claude Agent SDK (API, translation orchestration)
- **RDS**: PostgreSQL (document management, translation history, glossary)
- **Extra 1**: Redis - cache (prevent re-translation of same document)
- **Extra 2**: Claude API - translation & quality review

**Difficulty**: ★★★☆☆ (Medium)

**Pros**:
- Directly addresses globalization needs of Japanese companies
- Before/after comparison is visually clear
- Especially appealing to bilingual (JP-EN) participants
- Glossary feature adds domain specificity

**Cons**:
- Translation quality criteria tend to be subjective
- Requires building specialized terminology dictionary

---

## アイデア4: SQL×AI エージェントアプリ / SQL×AI Agent Application

### 日本語
**概要**: Chinookデータベースに対して自然言語で質問し、AIがSQLを生成・実行して結果を可視化するシステム

**エージェントワークフロー**:
1. **SQL生成エージェント**: 自然言語の質問をSQLクエリに変換
2. **結果解釈エージェント**: クエリ結果を分析し、洞察を提供（グラフ推奨含む）

**技術構成**:
- **FE**: React + Vite（チャットUI、クエリ結果表示、グラフ可視化）
- **BE**: Node.js Express + Claude Agent SDK（エージェントループ制御）
- **RDS**: SQLite (ローカル) → PostgreSQL (AWS)
- **MCP**: stdio経由でDB接続（`server-sqlite` → `server-postgres`）
- **会話履歴**: JSONファイル (ローカル) → DynamoDB (AWS)
- **AI**: Amazon Bedrock Claude / Anthropic Claude API

**難易度**: ★★★☆☆（中）

**メリット**:
- MCP学習に最適（DB接続を題材に段階的理解）
- 自然言語 → SQL → 可視化の実用的フロー
- Chinookサンプルデータで本格的なクエリ体験
- ローカル（SQLite）→ クラウド（PostgreSQL）の移行体験
- initial-ideas.mdの技術スタックと完全一致

**デメリット**:
- SQLの基礎知識が必要（未経験者向け資料で対応可能）
- 複数ターン対話の実装が必要

### English
**Overview**: Query the Chinook database in natural language, AI generates SQL, executes it, and visualizes results

**Agent Workflow**:
1. **SQL Generation Agent**: Convert natural language questions to SQL queries
2. **Result Interpretation Agent**: Analyze query results and provide insights (including graph recommendations)

**Tech Stack**:
- **FE**: React + Vite (chat UI, query results, graph visualization)
- **BE**: Node.js Express + Claude Agent SDK (agent loop control)
- **RDS**: SQLite (local) → PostgreSQL (AWS)
- **MCP**: DB connection via stdio (`server-sqlite` → `server-postgres`)
- **Conversation history**: JSON file (local) → DynamoDB (AWS)
- **AI**: Amazon Bedrock Claude / Anthropic Claude API

**Difficulty**: ★★★☆☆ (Medium)

**Pros**:
- Optimal for MCP learning (DB connection as progressive learning subject)
- Practical flow: natural language → SQL → visualization
- Authentic query experience with Chinook sample data
- Experience migrating local (SQLite) → cloud (PostgreSQL)
- Perfect match with initial-ideas.md tech stack

**Cons**:
- Requires SQL basics (addressable with beginner materials)
- Needs multi-turn conversation implementation

---

## サンプルデータ評価 / Sample Data Evaluation

### 日本語

各アイデアにおけるオープンソースのサンプルデータの入手可能性:

| アイデア | データ入手容易性 | 利用可能なオープンデータセット | データ品質 |
|---------|----------------|---------------------------|----------|
| アイデア1: 顧客問い合わせ対応アシスタント | ⭐⭐⭐⭐⭐ | Stack Exchange Dump (CC-BY-SA)、Ubuntu IRC Logs (public)、GitHub Issues (各種) | 優 |
| アイデア2: 議事録自動生成アシスタント | ⭐⭐⭐⭐⭐ | AMI Corpus (CC-BY 4.0)、QMSum (MIT)、ICSI (open) | 優 |
| アイデア3: ドキュメント翻訳＆レビューシステム | ⭐⭐⭐⭐⭐ | JESC (CC-BY 4.0)、JParaCrawl (CC0)、Tatoeba (CC-BY) | 優 |
| アイデア4: SQL×AIエージェントアプリ | ⭐⭐⭐⭐⭐ | Chinook Database (Public Domain)、SQLite/PostgreSQL両対応 | 優 |

**主要オープンデータソース（ログイン不要）**:
- **Stack Exchange Data Dump**: 技術Q&A（CC-BY-SA 4.0）- archive.org経由
- **UCI Machine Learning Repository**: 学術用途のデータセット（CC-BY 4.0）
- **Hugging Face Datasets**: NLP系データセット（多様なオープンライセンス）- 直接ダウンロード可能
- **GitHub/GitHub Archive**: コードリポジトリ、Issues（各リポジトリのライセンスによる）
- **日本語データ**: JESC、JParaCrawl、livedoorニュースコーパス（すべてオープンライセンス）
- **Common Crawl**: ウェブクロールデータ（CC0）- S3経由で直接アクセス可能

### English

Open-source sample data availability for each idea:

| Idea | Data Accessibility | Available Open Datasets | Data Quality |
|------|-------------------|------------------------|--------------|
| Idea 1: Customer Inquiry Response Assistant | ⭐⭐⭐⭐⭐ | Stack Exchange Dump (CC-BY-SA), Ubuntu IRC Logs (public), GitHub Issues (various) | Excellent |
| Idea 2: Meeting Minutes Assistant | ⭐⭐⭐⭐⭐ | AMI Corpus (CC-BY 4.0), QMSum (MIT), ICSI (open) | Excellent |
| Idea 3: Document Translation & Review System | ⭐⭐⭐⭐⭐ | JESC (CC-BY 4.0), JParaCrawl (CC0), Tatoeba (CC-BY) | Excellent |
| Idea 4: SQL×AI Agent Application | ⭐⭐⭐⭐⭐ | Chinook Database (Public Domain), SQLite/PostgreSQL support | Excellent |

**Major Open Data Sources (No Login Required)**:
- **Stack Exchange Data Dump**: Technical Q&A (CC-BY-SA 4.0) - via archive.org
- **UCI Machine Learning Repository**: Academic datasets (CC-BY 4.0)
- **Hugging Face Datasets**: NLP datasets (various open licenses) - direct download
- **GitHub/GitHub Archive**: Code repositories, Issues (per-repo licenses)
- **Japanese data**: JESC, JParaCrawl, livedoor News Corpus (all open licenses)
- **Common Crawl**: Web crawl data (CC0) - direct S3 access

---

---

## アプリケーション評価まとめ / Application Evaluation Summary

> **注意 / Note**: Docker要否、AWS Free Tier詳細、データセットダウンロード方法等の技術的詳細は [training-prerequisites.md](./training-prerequisites.md) および [REQUIREMENTS_ANALYSIS.md](./REQUIREMENTS_ANALYSIS.md) を参照してください。

## Docker要否の評価 / Docker Requirements Evaluation

### 日本語

各アイデアにおけるDocker依存度の評価（仮想環境での動作を考慮）:

| アイデア | Docker必須度 | Docker不要での実現可能性 | 推奨開発環境 |
|---------|------------|---------------------|------------|
| アイデア1: 顧客問い合わせ対応アシスタント | ⭐☆☆☆☆（完全不要） | ⭐⭐⭐⭐⭐（完全に可能） | Node.js Express + Claude Agent SDK + SQLite/PostgreSQL |
| アイデア2: 議事録自動生成アシスタント | ⭐☆☆☆☆（完全不要） | ⭐⭐⭐⭐⭐（完全に可能） | Node.js Express + Claude Agent SDK + SQLite |
| アイデア3: ドキュメント翻訳＆レビューシステム | ⭐☆☆☆☆（完全不要） | ⭐⭐⭐⭐⭐（完全に可能） | Node.js Express + Claude Agent SDK + SQLite/PostgreSQL |
| アイデア4: SQL×AIエージェントアプリ | ⭐☆☆☆☆（完全不要） | ⭐⭐⭐⭐⭐（完全に可能） | Node.js Express + Claude Agent SDK + SQLite → PostgreSQL |

**Docker不要で開発可能なアプローチ**:

1. **アイデア1: 顧客問い合わせ対応アシスタント**
   - FE: React + Vite（`npm run dev`）
   - BE: Node.js Express + Claude Agent SDK（`node server.js`）
   - DB: SQLite または PostgreSQL（Windowsインストーラー）
   - Cache: Node.js内メモリキャッシュ（Redisの代替）
   - **Docker完全不要**

2. **アイデア2: 議事録自動生成アシスタント**
   - FE: React + Vite（`npm run dev`でローカル起動）
   - BE: Node.js Express + Claude Agent SDK（`node server.js`）
   - DB: SQLite（ファイルベース、インストール不要）
   - Queue: 不要（同期処理で十分）
   - **Docker完全不要**

3. **アイデア3: ドキュメント翻訳＆レビューシステム**
   - FE: React + Vite（`npm run dev`）
   - BE: Node.js Express + Claude Agent SDK
   - DB: SQLite または PostgreSQL（Windowsインストーラー利用）
   - Cache: Node.js内メモリキャッシュ（Redisの代替）
   - **Docker完全不要**

4. **アイデア4: SQL×AIエージェントアプリ**
   - FE: React + Vite（`npm run dev`）
   - BE: Node.js Express + Claude Agent SDK
   - DB: SQLite（`better-sqlite3`）→ PostgreSQL（Windowsインストーラー）
   - MCP: stdio経由（`server-sqlite` → `server-postgres`）
   - 会話履歴: JSONファイル → DynamoDB（AWS移行時）
   - **Docker完全不要**（完全Windows ネイティブ）

**仮想環境でDocker利用が困難な場合の対策**:
- PostgreSQL: Windows用インストーラー（https://www.postgresql.org/download/windows/）
- SQLite: Pythonビルトイン、Node.js用パッケージ（`better-sqlite3`）
- Redis: Windows用バイナリ（https://github.com/tporadowski/redis/releases）またはメモリキャッシュで代替
- Object Storage: ローカルファイルシステムで代替

### English

Docker dependency evaluation for each idea (considering virtualized environments):

| Idea | Docker Requirement | Non-Docker Feasibility | Recommended Setup |
|------|-------------------|------------------------|-------------------|
| Idea 1: Customer Inquiry Assistant | ⭐☆☆☆☆ (Not required) | ⭐⭐⭐⭐⭐ (Fully possible) | Node.js Express + Claude Agent SDK + SQLite/PostgreSQL |
| Idea 2: Meeting Minutes Assistant | ⭐☆☆☆☆ (Not required) | ⭐⭐⭐⭐⭐ (Fully possible) | Node.js Express + Claude Agent SDK + SQLite |
| Idea 3: Document Translation & Review | ⭐☆☆☆☆ (Not required) | ⭐⭐⭐⭐⭐ (Fully possible) | Node.js Express + Claude Agent SDK + SQLite/PostgreSQL |
| Idea 4: SQL×AI Agent Application | ⭐☆☆☆☆ (Not required) | ⭐⭐⭐⭐⭐ (Fully possible) | Node.js Express + Claude Agent SDK + SQLite → PostgreSQL |

**Non-Docker Development Approaches**:

1. **Idea 1: Customer Inquiry Response Assistant**
   - FE: React + Vite (`npm run dev`)
   - BE: Node.js Express + Claude Agent SDK (`node server.js`)
   - DB: SQLite or PostgreSQL (Windows installer)
   - Cache: Node.js in-memory cache (Redis alternative)
   - **Docker not required**

2. **Idea 2: Meeting Minutes Assistant**
   - FE: React + Vite (`npm run dev` for local startup)
   - BE: Node.js Express + Claude Agent SDK (`node server.js`)
   - DB: SQLite (file-based, no installation needed)
   - Queue: Not needed (synchronous processing sufficient)
   - **Docker not required**

3. **Idea 3: Document Translation & Review System**
   - FE: React + Vite (`npm run dev`)
   - BE: Node.js Express + Claude Agent SDK
   - DB: SQLite or PostgreSQL (Windows installer)
   - Cache: Node.js in-memory cache (Redis alternative)
   - **Docker not required**

4. **Idea 4: SQL×AI Agent Application**
   - FE: React + Vite (`npm run dev`)
   - BE: Node.js Express + Claude Agent SDK
   - DB: SQLite (`better-sqlite3`) → PostgreSQL (Windows installer)
   - MCP: stdio (`server-sqlite` → `server-postgres`)
   - Conversation history: JSON file → DynamoDB (when migrating to AWS)
   - **Docker not required** (fully Windows native)

**Alternatives when Docker is unavailable in virtualized environments**:
- PostgreSQL: Windows installer (https://www.postgresql.org/download/windows/)
- SQLite: Python built-in, Node.js package (`better-sqlite3`)
- Redis: Windows binaries (https://github.com/tporadowski/redis/releases) or in-memory cache
- Object Storage: Replace with local filesystem

---

## プリセールスエンジニア視点での評価 / Evaluation from Pre-sales Engineer Perspective

### 日本語

各アイデアをプリセールスエンジニアの業務関連性、汎用性、サンプルデータ入手性で評価:

| アイデア | プリセールス関連性 | 汎用性 | サンプルデータ | Docker不要度 | 総合評価 |
|---------|------------------|--------|-------------|------------|----------|
| アイデア1: 顧客問い合わせ対応アシスタント | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | **推奨** |
| アイデア2: 議事録自動生成アシスタント | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | **最推奨** |
| アイデア3: ドキュメント翻訳＆レビューシステム | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | **最推奨** |
| アイデア4: SQL×AIエージェントアプリ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | ⭐⭐⭐⭐⭐ | **強く推奨** |

**プリセールスエンジニアが日常的に行う業務**:
- 顧客ヒアリング・要件定義のための打ち合わせ
- 技術提案書・見積書の作成
- 顧客からの技術的な問い合わせへの対応
- POC（概念実証）のデモ準備
- 社内の営業チームや技術チームとの調整

### English

Evaluating each idea by pre-sales engineer relevance and reusability:

| Idea | Pre-sales Relevance | Reusability | Overall Rating |
|------|---------------------|-------------|----------------|
| Idea 1: Customer Inquiry Response Assistant | ⭐⭐⭐⭐ Used for technical QA & proposal response | ⭐⭐⭐⭐⭐ Applicable across all industries | **Recommended** |
| Idea 2: Meeting Minutes Assistant | ⭐⭐⭐⭐⭐ Frequent use in client visits & proposal meetings | ⭐⭐⭐⭐⭐ Applicable across all industries | **Top recommendation** |
| Idea 3: Document Translation & Review System | ⭐⭐⭐⭐⭐ Proposal & technical doc translation | ⭐⭐⭐⭐ For global-facing companies | **Top recommendation** |
| Idea 4: SQL×AI Agent Application | ⭐⭐⭐⭐⭐ POC demos & data analysis for proposals | ⭐⭐⭐⭐⭐ Applicable across all industries | **Strongly recommended** |

**Daily tasks of pre-sales engineers**:
- Client interviews & requirement-definition meetings
- Creating technical proposals & quotations
- Responding to technical inquiries from customers
- Preparing POC (proof-of-concept) demos
- Coordination with internal sales and technical teams

---

## 推奨順位（最終版）/ Recommended Priority (Final)

### 日本語

**サンプルデータ要件とDocker要否を考慮した再評価**により、推奨順位が変更されました:

1. **アイデア1: 顧客問い合わせ対応アシスタント** ⭐⭐⭐⭐
   - **難易度**: 中
   - **プリセールス関連性**: 高（技術QA・提案対応）
   - **汎用性**: 最高（業界問わず活用可能）
   - **サンプルデータ**: **最優秀** - Stack Exchange Data Dump (CC-BY-SA)、Ubuntu IRC Logs (Public Domain)
   - **Docker要否**: **ほぼ不要** - Python FastAPI + SQLite で可能（Redisはメモリキャッシュで代替）
   - **エージェント学習**: 2ステップエージェントの学習に最適
   - **データ例**: 数百万件の実際の技術サポート会話、カテゴリ・タグ付き、ログイン不要

2. **アイデア2: 議事録自動生成アシスタント** ⭐⭐⭐⭐⭐
   - **難易度**: 低〜中
   - **プリセールス関連性**: 最高（顧客訪問・提案会議で毎回使用）
   - **汎用性**: 最高（あらゆる業界・業種で活用可能）
   - **サンプルデータ**: **優秀** - AMI Meeting Corpus (CC-BY 4.0)、QMSum (MIT)
   - **Docker要否**: **不要** - Node.js + SQLite で完結可能
   - **エージェント学習**: 要約→タスク抽出の2ステップ
   - **データ例**: 1,800件以上の会議トランスクリプト、要約・タスク付き

3. **アイデア3: ドキュメント翻訳＆レビューシステム** ⭐⭐⭐⭐⭐
   - **難易度**: 中
   - **プリセールス関連性**: 最高（提案書・技術資料の翻訳）
   - **汎用性**: 高（グローバル対応企業向け）
   - **サンプルデータ**: **最優秀** - JESC (CC-BY 4.0, 320万文ペア)、JParaCrawl (CC0, 1000万文ペア)
   - **Docker要否**: **不要** - Node.js + SQLite/PostgreSQL で完結
   - **エージェント学習**: 翻訳→品質レビューの2ステップ
   - **データ例**: 日英対訳の技術文書・ビジネス文書

4. **アイデア4: SQL×AIエージェントアプリ** ⭐⭐⭐⭐⭐
   - **難易度**: 中
   - **プリセールス関連性**: 最高（POCデモ・データ分析提案で頻繁に使用）
   - **汎用性**: 最高（あらゆる業界でDB分析需要あり）
   - **サンプルデータ**: **優秀** - Chinook Database (Public Domain)、SQLite/PostgreSQL両対応
   - **Docker要否**: **不要** - Node.js + SQLite → PostgreSQL で完結
   - **エージェント学習**: SQL生成→結果解釈の2ステップ、MCP学習に最適
   - **データ例**: 音楽ストアDB（11テーブル）、複雑な結合・集計クエリ対応
   - **特徴**: initial-ideas.mdの参照アーキテクチャと完全一致

**最終推奨の組み合わせ（Docker制約を考慮）**:

### パターンA: 日本語重視（Docker不要）
- **第2回（バイブコーディング・4h）**: アイデア2: 議事録自動生成アシスタント
  - 理由: Docker不要、難易度が低く短時間で完成、プリセールス業務に直結
  - 技術スタック: Node.js + SQLite + React（全てローカル実行可能）
- **第3〜5回（プロトタイプ開発・12h）**: アイデア3: ドキュメント翻訳＆レビューシステム
  - 理由: Docker不要、日本のSI企業に直結、高品質な日本語データが豊富
  - 技術スタック: Node.js + SQLite/PostgreSQL + React（全てローカル実行可能）

### パターンB: MCP/データ分析重視（Docker不要）
- **第2回（バイブコーディング・4h）**: アイデア2: 議事録自動生成アシスタント
- **第3〜5回（プロトタイプ開発・12h）**: アイデア4: SQL×AIエージェントアプリ
  - 理由: Docker不要、MCP学習に最適、initial-ideas.mdと完全一致
  - 技術スタック: Node.js + SQLite → PostgreSQL + MCP（全てローカル実行可能）

### パターンC: 技術サポート重視（Docker低依存）
- **第2回（バイブコーディング・4h）**: アイデア2: 議事録自動生成アシスタント
- **第3〜5回（プロトタイプ開発・12h）**: アイデア1: 顧客問い合わせ対応アシスタント
  - 理由: ほぼDocker不要（Redis省略可能）、技術サポート業務に直結
  - 技術スタック: Python FastAPI + SQLite + React（Redisなしでも動作）

### English

**Re-evaluation considering sample data requirements and Docker constraints** has changed the priority order:

1. **Idea 1: Customer Inquiry Response Assistant** ⭐⭐⭐⭐
   - **Difficulty**: Medium
   - **Pre-sales Relevance**: High (technical QA & proposal response)
   - **Reusability**: Highest (applicable across all industries)
   - **Sample Data**: **Excellent** - Stack Exchange Data Dump (CC-BY-SA), Ubuntu IRC Logs (Public Domain)
   - **Docker Required**: **Almost No** - Works with Python FastAPI + SQLite (Redis can be replaced with in-memory cache)
   - **Agent Learning**: Optimal for 2-step agent learning
   - **Data examples**: Millions of real technical support conversations, categorized & tagged, no login required

2. **Idea 2: Meeting Minutes Assistant** ⭐⭐⭐⭐⭐
   - **Difficulty**: Low to Medium
   - **Pre-sales Relevance**: Highest (used in every client visit & proposal meeting)
   - **Reusability**: Highest (applicable across all industries and roles)
   - **Sample Data**: **Excellent** - AMI Meeting Corpus (CC-BY 4.0), QMSum (MIT)
   - **Docker Required**: **No** - Works with Node.js + SQLite
   - **Agent Learning**: Summarization → task extraction 2-step
   - **Data examples**: 1,800+ meeting transcripts with summaries and action items

3. **Idea 3: Document Translation & Review System** ⭐⭐⭐⭐⭐
   - **Difficulty**: Medium
   - **Pre-sales Relevance**: Highest (proposal & technical doc translation)
   - **Reusability**: High (for global-facing companies)
   - **Sample Data**: **Excellent** - JESC (CC-BY 4.0, 3.2M sentence pairs), JParaCrawl (CC0, 10M sentence pairs)
   - **Docker Required**: **No** - Works with Node.js + SQLite/PostgreSQL
   - **Agent Learning**: Translation → quality review 2-step
   - **Data examples**: Japanese-English parallel technical & business documents

4. **Idea 4: SQL×AI Agent Application** ⭐⭐⭐⭐⭐
   - **Difficulty**: Medium
   - **Pre-sales Relevance**: Highest (POC demos & data analysis for proposals)
   - **Reusability**: Highest (DB analysis needs across all industries)
   - **Sample Data**: **Excellent** - Chinook Database (Public Domain), SQLite/PostgreSQL support
   - **Docker Required**: **No** - Works with Node.js + SQLite → PostgreSQL
   - **Agent Learning**: SQL generation → result interpretation 2-step, optimal for MCP learning
   - **Data examples**: Music store DB (11 tables), complex join & aggregation queries
   - **Feature**: Perfect match with initial-ideas.md reference architecture

**Final Recommended Combinations (Considering Docker Constraints)**:

### Pattern A: Japanese Language Focus (No Docker Required)
- **Session 2 (Vibe Coding, 4h)**: Idea 2: Meeting Minutes Assistant
  - Rationale: No Docker needed, lower difficulty, quick to complete, directly relevant to pre-sales work
  - Tech Stack: Node.js + SQLite + React (all runnable locally)
- **Sessions 3-5 (Prototype Development, 12h)**: Idea 3: Document Translation & Review System
  - Rationale: No Docker needed, directly relevant to Japanese SI companies, abundant Japanese data
  - Tech Stack: Node.js + SQLite/PostgreSQL + React (all runnable locally)

### Pattern B: MCP/Data Analysis Focus (No Docker Required)
- **Session 2 (Vibe Coding, 4h)**: Idea 2: Meeting Minutes Assistant
- **Sessions 3-5 (Prototype Development, 12h)**: Idea 4: SQL×AI Agent Application
  - Rationale: No Docker needed, optimal for MCP learning, perfect match with initial-ideas.md
  - Tech Stack: Node.js + SQLite → PostgreSQL + MCP (all runnable locally)

### Pattern C: Technical Support Focus (Low Docker Dependency)
- **Session 2 (Vibe Coding, 4h)**: Idea 2: Meeting Minutes Assistant
- **Sessions 3-5 (Prototype Development, 12h)**: Idea 1: Customer Inquiry Response Assistant
  - Rationale: Almost no Docker needed (Redis optional), directly relevant to technical support work
  - Tech Stack: Python FastAPI + SQLite + React (works without Redis)

---

## オープンデータセット詳細 / Open Dataset Details

### 顧客問い合わせ対応アシスタント用データ

**Stack Exchange Data Dump**
- **ソース**: https://archive.org/details/stackexchange
- **ライセンス**: CC BY-SA 4.0
- **サイズ**: 数百万件のQ&Aペア（Stack Overflow、Super User、Server Faultなど）
- **内容**: 技術的な質問と回答（プリセールスエンジニアに非常に関連性が高い）
- **形式**: XML
- **利点**: ログイン不要、直接ダウンロード可能、技術サポートに最適
- **ダウンロード**: `wget`で直接取得可能

**Ubuntu IRC Logs**
- **ソース**: https://irclogs.ubuntu.com/
- **ライセンス**: Public Domain
- **サイズ**: 数百万件のサポート会話
- **内容**: Ubuntu サポートチャンネルの実際のヘルプデスク会話
- **形式**: プレーンテキスト
- **利点**: ログイン不要、実際のカスタマーサポートパターン

**GitHub Issues (Public Repositories)**
- **ソース**: GitHub Archive (https://www.gharchive.org/)
- **ライセンス**: 各リポジトリによる（多くがMIT/Apache）
- **サイズ**: 数千万件のissues・コメント
- **内容**: ソフトウェアプロジェクトのバグレポート・質問・回答
- **形式**: JSON
- **利点**: GitHub API経由でログイン不要でアクセス可能、技術的な問い合わせに最適

### ドキュメント翻訳＆レビューシステム用データ

**JESC (Japanese-English Subtitle Corpus)**
- **ソース**: https://nlp.stanford.edu/projects/jesc/
- **ライセンス**: CC-BY 4.0
- **サイズ**: 320万文ペア
- **内容**: 映画・ドラマの字幕（ビジネス会話も含む）
- **形式**: TSV
- **利点**: 自然な日本語・英語表現

**JParaCrawl**
- **ソース**: http://www.kecl.ntt.co.jp/icl/lirg/jparacrawl/
- **ライセンス**: CC0 (Public Domain)
- **サイズ**: 1000万文ペア以上
- **内容**: ウェブからクロールした日英対訳文
- **形式**: TSV

**Tatoeba**
- **ソース**: https://tatoeba.org/en/downloads
- **ライセンス**: CC-BY 2.0 FR
- **サイズ**: 日英ペア約30万文
- **内容**: コミュニティが作成した多言語例文
- **形式**: TSV

### 求人・候補者マッチングシステム用データ

**Common Crawl Job Postings**
- **ソース**: https://commoncrawl.org/
- **ライセンス**: CC0 (Public Domain)
- **サイズ**: 数百万件のジョブポスティング
- **内容**: ウェブからクロールした求人情報
- **形式**: WARC/JSON
- **利点**: S3経由で直接アクセス可能（`aws s3 ls s3://commoncrawl/ --no-sign-request`）

**Stack Overflow Developer Survey**
- **ソース**: https://insights.stackoverflow.com/survey
- **ライセンス**: ODbL (Open Database License)
- **サイズ**: 年間8万人以上の開発者データ
- **内容**: スキル、経験年数、給与、技術スタック
- **形式**: CSV
- **利点**: ログイン不要、直接ダウンロード可能

### 在庫発注推奨システム用データ

**UCI Online Retail Dataset**
- **ソース**: https://archive.ics.uci.edu/ml/datasets/Online+Retail
- **ライセンス**: CC-BY 4.0
- **サイズ**: 50万件以上の取引記録
- **内容**: オンライン小売店の実際の取引データ（2010-2011）
- **形式**: CSV
- **利点**: ログイン不要、直接ダウンロード可能

**Open Food Facts**
- **ソース**: https://world.openfoodfacts.org/data
- **ライセンス**: ODbL
- **サイズ**: 200万件以上の食品データ
- **内容**: 製品情報、在庫推移、販売データ
- **形式**: CSV/JSON
- **利点**: API経由でもアクセス可能、ログイン不要

### 議事録自動生成アシスタント用データ

**AMI Meeting Corpus**
- **ソース**: https://groups.inf.ed.ac.uk/ami/corpus/
- **ライセンス**: CC-BY 4.0
- **サイズ**: 100時間の会議記録
- **内容**: シナリオベースの会議（4人チームでの製品開発会議）
- **形式**: XML（トランスクリプト）+ 音声
- **利点**: 要約・アクションアイテムのアノテーション付き、ログイン不要で直接ダウンロード可能

**ICSI Meeting Corpus**
- **ソース**: http://www1.icsi.berkeley.edu/Speech/mr/
- **ライセンス**: Open (学術・商用利用可)
- **サイズ**: 72時間の会議記録
- **内容**: 実際の研究会議
- **利点**: ログイン不要、直接ダウンロード可能

**QMSum (Query-based Multi-domain Meeting Summarization)**
- **ソース**: https://github.com/Yale-LILY/QMSum
- **ライセンス**: MIT
- **サイズ**: 1,808件の会議トランスクリプト
- **内容**: 学術会議、製品会議、委員会会議など
- **形式**: JSON
- **利点**: GitHub経由で直接ダウンロード可能、要約付き

---

## データセットダウンロード方法 / Dataset Download Methods

### ログイン不要でダウンロード可能なデータセット / No-Login Download Instructions

**Stack Exchange Data Dump**
```bash
# Archive.orgから直接ダウンロード（例: Stack Overflow）
wget https://archive.org/download/stackexchange/stackoverflow.com-Posts.7z
7z x stackoverflow.com-Posts.7z
```

**Ubuntu IRC Logs**
```bash
# 特定のチャンネル・日付のログを取得
wget -r -np -nH --cut-dirs=1 https://irclogs.ubuntu.com/2024/01/01/%23ubuntu.txt
```

**GitHub Archive (Issues/Comments)**
```bash
# GitHub APIを使用（認証不要、レート制限あり）
curl https://api.github.com/repos/microsoft/vscode/issues?state=all&per_page=100 > issues.json
```

**AMI Meeting Corpus**
```bash
# AMIウェブサイトから直接ダウンロード
wget http://groups.inf.ed.ac.uk/ami/AMICorpusFull/amicorpus/ES2002a.zip
unzip ES2002a.zip
```

**JESC (Japanese-English Subtitle Corpus)**
```bash
# 直接ダウンロード
wget https://nlp.stanford.edu/projects/jesc/data/split.tar.gz
tar -xzf split.tar.gz
```

**JParaCrawl**
```bash
# NTT提供のデータを直接ダウンロード
wget http://www.kecl.ntt.co.jp/icl/lirg/jparacrawl/release/3.0/bitext/en-ja.tar.gz
tar -xzf en-ja.tar.gz
```

**UCI Machine Learning Repository**
```bash
# 例: Online Retail Dataset
wget https://archive.ics.uci.edu/ml/machine-learning-databases/00352/Online%20Retail.xlsx
```

**Stack Overflow Developer Survey**
```bash
# 最新年度のデータをダウンロード
wget https://info.stackoverflowsolutions.com/rs/719-EMH-566/images/stack-overflow-developer-survey-2023.zip
unzip stack-overflow-developer-survey-2023.zip
```

### ダウンロードスクリプトの準備 / Preparing Download Scripts

研修用に、参加者が簡単にデータセットを取得できる自動化スクリプトを用意することを推奨:

```bash
# download_datasets.sh
#!/bin/bash
mkdir -p data/{customer-inquiry,translation,meetings}

# Customer Inquiry データ
echo "Downloading Stack Exchange data..."
wget -P data/customer-inquiry/ https://archive.org/download/stackexchange/stackoverflow.com-Posts.7z

# Translation データ
echo "Downloading JESC..."
wget -P data/translation/ https://nlp.stanford.edu/projects/jesc/data/split.tar.gz

# Meeting データ
echo "Downloading AMI Corpus sample..."
wget -P data/meetings/ http://groups.inf.ed.ac.uk/ami/AMICorpusFull/amicorpus/ES2002a.zip

echo "All datasets downloaded!"
```

---

## AWS デプロイメント評価 / AWS Deployment Evaluation

### AWS Free Tier制約 / AWS Free Tier Limits

**AWS Free Tier主要サービスの制限**:
- **EC2**: t2.micro/t3.micro 750時間/月（Linux）
- **RDS**: db.t2.micro/db.t3.micro 750時間/月 + 20GB ストレージ
- **S3**: 5GB標準ストレージ、20,000 GET、2,000 PUT リクエスト/月
- **Lambda**: 100万リクエスト/月、400,000 GB秒のコンピュート
- **API Gateway**: 100万APIコール/月（12ヶ月間）
- **DynamoDB**: 25GB ストレージ、25 読み取り/書き込みキャパシティユニット
- **CloudFront**: 50GB転送、200万リクエスト/月（12ヶ月間）
- **SQS**: 100万リクエスト/月

**Free Tierに含まれないサービス**:
- ❌ Elastic Load Balancer (~$16/月最低料金)
- ❌ ElastiCache (Redis) (~$13/月最低料金)
- ❌ OpenSearch/Elasticsearch (~$23/月最低料金)
- ❌ AWS Textract (最初の3ヶ月のみ1,000ページ無料、その後有料)
- ❌ NAT Gateway (~$32/月 + データ転送料)

### 各アプリのAWSアーキテクチャと費用分析

| アイデア | AWSアーキテクチャ | Free Tier適合性 | 月額推定コスト | 制約事項 |
|---------|-----------------|----------------|--------------|---------|
| **アイデア1: 顧客問い合わせ対応** | FE: S3+CloudFront<br>BE: Lambda+API Gateway<br>DB: RDS db.t2.micro<br>Cache: DynamoDB | ⭐⭐⭐⭐⭐<br>**完全適合** | **$0** | Redis不要、DynamoDBまたはLambda内メモリ |
| **アイデア2: 議事録自動生成アシスタント** | FE: S3+CloudFront<br>BE: Lambda+API Gateway<br>DB: RDS db.t2.micro<br>Storage: S3 | ⭐⭐⭐⭐⭐<br>**完全適合** | **$0** | トラフィックが制限内であれば完全無料 |
| **アイデア3: ドキュメント翻訳＆レビュー** | FE: S3+CloudFront<br>BE: Lambda+API Gateway<br>DB: RDS db.t2.micro<br>Cache: DynamoDB | ⭐⭐⭐⭐⭐<br>**完全適合** | **$0** | Redis不要、DynamoDBで代替可能 |
| **アイデア4: SQL×AIエージェントアプリ** | FE: S3+CloudFront<br>BE: Lambda+API Gateway<br>DB: RDS PostgreSQL<br>History: DynamoDB | ⭐⭐⭐⭐⭐<br>**完全適合** | **$0** | initial-ideas.mdの参照アーキテクチャと完全一致 |

### 推奨AWSアーキテクチャ詳細

#### 1. 議事録自動生成アシスタント（AWS Free Tier完全適合）

```
┌─────────────┐
│   Users     │
└──────┬──────┘
       │
┌──────▼────────────┐
│  CloudFront (CDN) │ ← 50GB/月、200万リクエスト無料
└──────┬────────────┘
       │
┌──────▼──────┐
│  S3 Bucket  │ ← 5GB無料、静的サイトホスティング
│   (React)   │
└─────────────┘

       │ API Call
       ▼
┌──────────────────┐
│  API Gateway     │ ← 100万コール/月無料
└──────┬───────────┘
       │
┌──────▼──────────┐
│  Lambda Function│ ← 100万リクエスト/月無料
│  (Node.js/Python)│    Claude API呼び出し
└──────┬──────────┘
       │
┌──────▼──────────┐
│  RDS PostgreSQL │ ← db.t2.micro 750時間/月無料
│  (db.t2.micro)  │    20GB無料
└─────────────────┘
```

**推定月額コスト**: **$0**（Free Tier内）
**Claude API コスト**: 使用量による（別途）

#### 2. ドキュメント翻訳＆レビューシステム（AWS Free Tier完全適合）

```
┌─────────────┐
│   Users     │
└──────┬──────┘
       │
┌──────▼────────────┐
│  CloudFront (CDN) │ ← 無料
└──────┬────────────┘
       │
┌──────▼──────┐
│  S3 Bucket  │ ← 無料（5GB以内）
│   (React)   │
└─────────────┘

       │
       ▼
┌──────────────────┐
│  API Gateway     │ ← 無料
└──────┬───────────┘
       │
┌──────▼──────────┐
│  Lambda Function│ ← 無料
│  (Node.js)      │    翻訳・レビュー処理
└──────┬──────────┘
       │
       ├──────────────┐
       │              │
┌──────▼──────────┐  │
│  RDS PostgreSQL │  │
│  (db.t2.micro)  │  │
└─────────────────┘  │
                     │
            ┌────────▼────────┐
            │   DynamoDB      │ ← 25GB無料
            │ (Cache/Session) │
            └─────────────────┘
```

**推定月額コスト**: **$0**（Free Tier内）
**メリット**: ElastiCache不要、DynamoDBで代替

#### 3. 顧客問い合わせ対応アシスタント（AWS Free Tier完全適合）

同様のアーキテクチャで、**$0/月**で運用可能。

### Free Tier超過時の対策

**トラフィック超過対策**:
1. **CloudFront制限超過** → S3直接アクセスに切り替え（50GB → 5GBに注意）
2. **Lambda制限超過** → EC2 t2.microに移行（750時間無料）
3. **API Gateway制限超過** → EC2上でExpressサーバー稼働

**コスト最適化アーキテクチャ（完全無料）**:

```
┌─────────────┐
│   Users     │
└──────┬──────┘
       │
┌──────▼──────┐
│  S3 Bucket  │ ← 静的サイト（CloudFront省略可能）
│   (React)   │
└──────┬──────┘
       │
       ▼
┌─────────────────────┐
│  EC2 t2.micro       │ ← 750時間/月無料（1インスタンス常時稼働可能）
│  - Node.js/Python   │
│  - Express API      │
│  - Claude API呼び出し│
└──────┬──────────────┘
       │
┌──────▼──────────┐
│  RDS PostgreSQL │ ← 750時間/月無料
│  (db.t2.micro)  │
└─────────────────┘
```

**このアーキテクチャの利点**:
- ✅ API Gateway不要（制限なし）
- ✅ Lambda不要（制限なし）
- ✅ 完全に無料（12ヶ月後もt2.microは低コスト）
- ✅ デバッグ・監視が容易

### 費用対効果分析

| パターン | アーキテクチャ | Free Tier適合 | 12ヶ月後の月額コスト | 推奨度 |
|---------|--------------|--------------|-------------------|--------|
| **パターンA（最推奨）** | 議事録 + 翻訳 | ⭐⭐⭐⭐⭐ | $15-20（EC2+RDS） | **最推奨** |
| **パターンB** | 議事録 + 問い合わせ | ⭐⭐⭐⭐⭐ | $15-20（EC2+RDS） | **推奨** |
| 領収書処理を含む | 領収書アプリ | ⭐⭐☆☆☆ | $50-100+（Textract課金） | 非推奨 |

### English

### AWS Deployment Architecture and Free Tier Analysis

**AWS Free Tier Limits**:
- **EC2**: t2.micro/t3.micro 750 hours/month (Linux)
- **RDS**: db.t2.micro/db.t3.micro 750 hours/month + 20GB storage
- **S3**: 5GB standard storage, 20,000 GET, 2,000 PUT requests/month
- **Lambda**: 1M requests/month, 400,000 GB-seconds compute
- **API Gateway**: 1M API calls/month (12 months)
- **DynamoDB**: 25GB storage, 25 read/write capacity units
- **CloudFront**: 50GB transfer, 2M requests/month (12 months)

**Not in Free Tier**:
- ❌ Elastic Load Balancer (~$16/month minimum)
- ❌ ElastiCache (Redis) (~$13/month minimum)
- ❌ OpenSearch/Elasticsearch (~$23/month minimum)
- ❌ AWS Textract (1,000 pages free first 3 months only)

### App-by-App AWS Cost Analysis

| App | AWS Architecture | Free Tier Fit | Est. Monthly Cost | Notes |
|-----|-----------------|---------------|-------------------|-------|
| **Idea 1: Customer Inquiry** | S3+CloudFront, Lambda+API Gateway, RDS, DynamoDB | ⭐⭐⭐⭐⭐<br>**Perfect Fit** | **$0** | No Redis needed |
| **Idea 2: Meeting Minutes** | S3+CloudFront, Lambda+API Gateway, RDS db.t2.micro | ⭐⭐⭐⭐⭐<br>**Perfect Fit** | **$0** | Fully free within limits |
| **Idea 3: Translation & Review** | S3+CloudFront, Lambda+API Gateway, RDS, DynamoDB | ⭐⭐⭐⭐⭐<br>**Perfect Fit** | **$0** | No Redis needed, use DynamoDB |
| **Idea 4: SQL×AI Agent App** | S3+CloudFront, Lambda+API Gateway, RDS PostgreSQL, DynamoDB | ⭐⭐⭐⭐⭐<br>**Perfect Fit** | **$0** | Perfect match with initial-ideas.md |

### Recommended AWS Architecture (100% Free Tier)

**Option 1: Serverless (Lambda + API Gateway)**
- Best for: Low/moderate traffic
- Free Tier: 1M Lambda requests, 1M API Gateway calls
- Cost after 12 months: May need to pay for API Gateway

**Option 2: EC2-based (Most Reliable for Free Tier)**
```
S3 (Static Site) → EC2 t2.micro (API Server) → RDS db.t2.micro
```
- Best for: Consistent free tier usage
- 750 hours/month = 1 instance running 24/7
- Cost after 12 months: ~$15-20/month (EC2 + RDS)

**Verdict**: ✅ **All recommended apps (Meeting Minutes, Translation, Customer Inquiry) fit within AWS Free Tier for 12 months**

---

## AWS デプロイメント手順（Free Tier）/ AWS Deployment Steps (Free Tier)

### 推奨デプロイメント手順

#### フェーズ1: ローカル開発（第2〜5回研修）
```bash
# ローカル環境で開発・テスト
- Node.js + SQLite（または PostgreSQL local）
- React開発サーバー（npm run dev）
- Claude API（開発者アカウント）
```

#### フェーズ2: AWS Free Tierデプロイ（研修後）

**ステップ1: AWSアカウント準備**
- AWS Free Tier アカウント作成
- IAM ユーザー作成（AdministratorAccess）
- AWS CLI インストール・設定

**ステップ2: データベースセットアップ**
```bash
# RDS PostgreSQL (db.t2.micro) 作成
aws rds create-db-instance \
  --db-instance-identifier meeting-assistant-db \
  --db-instance-class db.t2.micro \
  --engine postgres \
  --master-username dbadmin \
  --master-user-password [PASSWORD] \
  --allocated-storage 20 \
  --publicly-accessible
```

**ステップ3: バックエンドデプロイ（2つのオプション）**

**オプションA: Lambda + API Gateway（推奨）**
```bash
# Serverless Framework利用
npm install -g serverless
serverless deploy
```

**オプションB: EC2 + Express**
```bash
# EC2 t2.micro起動
aws ec2 run-instances \
  --image-id ami-xxxxx \
  --instance-type t2.micro \
  --key-name my-key

# Node.js/Pythonアプリデプロイ
ssh ec2-user@[EC2_IP]
git clone [REPO]
npm install && npm start
```

**ステップ4: フロントエンドデプロイ**
```bash
# Reactビルド
npm run build

# S3バケット作成＆静的サイトホスティング
aws s3 mb s3://meeting-assistant-frontend
aws s3 website s3://meeting-assistant-frontend \
  --index-document index.html

# ファイルアップロード
aws s3 sync ./build s3://meeting-assistant-frontend

# CloudFront配信（オプション）
aws cloudfront create-distribution \
  --origin-domain-name meeting-assistant-frontend.s3.amazonaws.com
```

**ステップ5: 環境変数設定**
```bash
# Lambda環境変数
aws lambda update-function-configuration \
  --function-name meeting-assistant \
  --environment Variables={
    CLAUDE_API_KEY=[KEY],
    DATABASE_URL=[RDS_ENDPOINT]
  }
```

### コスト監視設定

```bash
# AWS Budgets設定（Free Tier超過アラート）
aws budgets create-budget \
  --account-id [ACCOUNT_ID] \
  --budget file://budget.json \
  --notifications-with-subscribers file://notifications.json
```

**budget.json**:
```json
{
  "BudgetName": "FreeTierBudget",
  "BudgetLimit": {
    "Amount": "1",
    "Unit": "USD"
  },
  "TimeUnit": "MONTHLY",
  "BudgetType": "COST"
}
```

### Free Tier制限モニタリング

| サービス | 制限 | 監視方法 |
|---------|------|---------|
| Lambda | 100万リクエスト/月 | CloudWatch メトリクス |
| API Gateway | 100万コール/月 | CloudWatch メトリクス |
| RDS | 750時間/月 | RDS コンソール |
| S3 | 5GB + 20K GET | S3 ストレージメトリクス |
| CloudFront | 50GB + 200万リクエスト | CloudFront レポート |

**アラート設定例**:
```bash
# Lambda実行回数が90万回超過でアラート
aws cloudwatch put-metric-alarm \
  --alarm-name lambda-invocations-high \
  --metric-name Invocations \
  --namespace AWS/Lambda \
  --statistic Sum \
  --period 2592000 \
  --threshold 900000 \
  --comparison-operator GreaterThanThreshold
```

---

## 最終推奨 / Final Recommendations

### 全要件適合性評価 / Overall Requirements Fit

| アイデア | データ入手<br>（Kaggle不使用） | Docker不要 | AWS Free Tier適合 | プリセールス関連性 | 総合スコア | 最終推奨 |
|---------|--------------------------|-----------|------------------|------------------|----------|---------|
| **アイデア1: 顧客問い合わせ** | ⭐⭐⭐⭐⭐<br>Stack Exchange | ⭐⭐⭐⭐<br>ほぼ不要 | ⭐⭐⭐⭐⭐<br>$0/月 | ⭐⭐⭐⭐<br>高 | **23/25** | ✅ **推奨** |
| **アイデア2: 議事録自動生成** | ⭐⭐⭐⭐⭐<br>AMI/QMSum | ⭐⭐⭐⭐⭐<br>完全不要 | ⭐⭐⭐⭐⭐<br>$0/月 | ⭐⭐⭐⭐⭐<br>最高 | **25/25** | ✅ **最推奨** |
| **アイデア3: 翻訳＆レビュー** | ⭐⭐⭐⭐⭐<br>JESC/JParaCrawl | ⭐⭐⭐⭐⭐<br>完全不要 | ⭐⭐⭐⭐⭐<br>$0/月 | ⭐⭐⭐⭐⭐<br>最高 | **25/25** | ✅ **最推奨** |
| **アイデア4: SQL×AIエージェント** | ⭐⭐⭐⭐⭐<br>Chinook DB | ⭐⭐⭐⭐⭐<br>完全不要 | ⭐⭐⭐⭐⭐<br>$0/月 | ⭐⭐⭐⭐⭐<br>最高 | **25/25** | ✅ **最推奨** |

### 推奨される組み合わせ / Recommended Combinations

#### パターンA: 日本語重視 / Pattern A: Japanese Language Focus
- **第2回（4h）**: アイデア2: 議事録自動生成アシスタント / Idea 2: Meeting Minutes Assistant
- **第3〜5回（12h）**: アイデア3: ドキュメント翻訳＆レビューシステム / Idea 3: Document Translation & Review System

#### パターンB: MCP/データ分析重視 / Pattern B: MCP/Data Analysis Focus
- **第2回（4h）**: アイデア2: 議事録自動生成アシスタント / Idea 2: Meeting Minutes Assistant
- **第3〜5回（12h）**: アイデア4: SQL×AIエージェントアプリ / Idea 4: SQL×AI Agent Application

#### パターンC: 技術サポート重視 / Pattern C: Technical Support Focus
- **第2回（4h）**: アイデア2: 議事録自動生成アシスタント / Idea 2: Meeting Minutes Assistant
- **第3〜5回（12h）**: アイデア1: 顧客問い合わせ対応アシスタント / Idea 1: Customer Inquiry Response Assistant

**達成される要件 / Requirements Achieved**:
- ✅ Kaggleアカウント不要 / No Kaggle account needed
- ✅ Docker完全不要 / Zero Docker required
- ✅ AWS Free Tier完全適合（$0/月 × 12ヶ月） / Full AWS Free Tier fit ($0/month × 12 months)
- ✅ プリセールスエンジニア業務に直結 / Directly relevant to pre-sales work
- ✅ エージェント型AIワークフロー学習 / Agentic AI workflow learning
- ✅ 適切な複雑度 / Appropriate complexity

詳細は [training-prerequisites.md](./training-prerequisites.md) および [REQUIREMENTS_ANALYSIS.md](./REQUIREMENTS_ANALYSIS.md) を参照。

For details, refer to [training-prerequisites.md](./training-prerequisites.md) and [REQUIREMENTS_ANALYSIS.md](./REQUIREMENTS_ANALYSIS.md).

---

## その他のアイデア（非推奨） / Other Ideas (Not Recommended)

以下のアイデアは技術的制約により研修には推奨しません。

The following ideas are not recommended for training due to technical constraints.

### アイデア: 求人・候補者マッチングシステム / Job-Candidate Matching System

**概要 / Summary**: 求人票と候補者のレジュメをAIが分析し、マッチング度をスコアリング / AI analyzes job postings and candidate resumes, scoring match quality

**非推奨理由 / Why Not Recommended**:
- ⚠️ Elasticsearch が必要だが、WSL2/Docker環境でのみ実行可能（仮想化Windows不可） / Requires Elasticsearch, which only runs on WSL2/Docker (not on virtualized Windows)
- ⚠️ PostgreSQL全文検索で代替可能だが、実装が複雑化 / Can substitute with PostgreSQL full-text search, but implementation becomes complex
- ⚠️ プリセールスエンジニア業務との関連性が低い / Low relevance to pre-sales engineer work
- **WSL2/Docker依存度**: 80% / WSL2/Docker dependency: 80%

---

### アイデア: 在庫発注推奨システム / Smart Inventory Recommendation System

**概要 / Summary**: 在庫データと販売履歴をAIが分析し、発注タイミングと数量を推奨 / AI analyzes inventory data and sales history, recommending order timing and quantities

**非推奨理由 / Why Not Recommended**:
- ⚠️ TimescaleDB（時系列DB拡張）が推奨だが、WSL2/Docker環境でのみ実行可能 / Recommends TimescaleDB (time-series extension), which only runs on WSL2/Docker
- ⚠️ 標準PostgreSQLで代替可能だが、時系列データ処理の学習価値が低下 / Can substitute with standard PostgreSQL, but reduces learning value for time-series processing
- ⚠️ 小売・製造業向けで汎用性が低い / Skewed toward retail/manufacturing, low reusability
- ⚠️ プリセールスエンジニア業務との関連性が最も低い / Lowest relevance to pre-sales engineer work
- **WSL2/Docker依存度**: 80% / WSL2/Docker dependency: 80%

---

### アイデア: スマート領収書処理システム / Smart Receipt Processing System

**概要 / Summary**: 領収書や請求書をアップロードし、AIが自動でデータを抽出・分類・保存 / Upload receipts/invoices and AI automatically extracts, categorizes, and stores data

**非推奨理由 / Why Not Recommended**:
- ❌ Object Storage (MinIO) が必要で、通常Docker環境でのみ実行可能 / Requires Object Storage (MinIO), typically only runs in Docker
- ❌ AWS S3を使用すると月額$15-50+のコストが発生（Free Tier超過） / Using AWS S3 incurs $15-50+/month cost (exceeds Free Tier)
- ❌ 画像処理ライブラリの依存関係が複雑 / Complex dependencies for image processing libraries
- ⚠️ OCR精度により体験がばらつく / Experience varies depending on OCR accuracy
- ⚠️ プリセールスエンジニア業務との関連性が低い / Low relevance to pre-sales engineer work
- **WSL2/Docker依存度**: 40% (多くの代替案が必要) / WSL2/Docker dependency: 40% (requires many workarounds)
- **AWS Free Tier適合性**: ⭐⭐☆☆☆（制約あり、月額$15-50+） / AWS Free Tier fit: ⭐⭐☆☆☆ (limited, $15-50+/month)

---

## 関連ドキュメント / Related Documents

- **[training-prerequisites.md](./training-prerequisites.md)**: 研修前提条件・技術要件・環境セットアップ / Training prerequisites, technical requirements, environment setup
- **[REQUIREMENTS_ANALYSIS.md](./REQUIREMENTS_ANALYSIS.md)**: 要件分析詳細・実現可能性検証 / Detailed requirements analysis and feasibility verification
- **[initial-ideas.md](./initial-ideas.md)**: 研修全体構成・セッション別詳細 / Overall training structure and session details
