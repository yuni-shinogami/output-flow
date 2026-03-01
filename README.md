# output-flow

LT・技術記事・書籍などのアウトプット作成を、Claude Codeとの対話で進めるためのスキル集です。

## 全体像

```
/idea（ネタ帳）──→ /outline（骨格づくり）──→ /write（記事執筆）
                                          └→ LTスライド作成（未実装）
                                          └→ 書籍執筆（未実装）
                                          └→ ...

/humanize（LLM表現チェック）── 任意のテキストに対して単独実行可能
                              └→ /write-review にも5つ目の観点として組み込み済み
```

思いついたネタを `/idea` で記録し、育てていきます。構成を作る準備ができたら `/outline` でアウトラインを作り、目的に応じた下流ワークフローでコンテンツを仕上げます。現在は **記事執筆（`/write`）** ワークフローが利用できます。

## 必要なもの

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code/overview) がインストール済みであること

## セットアップ

```bash
git clone https://github.com/yuni-shinogami/output-flow.git
cd output-flow
```

このディレクトリで `claude` を起動すれば、すぐにスキルが使えます。

## 使い方

### Step 0: ネタを記録する（任意）

```
/idea
```

アウトプットのネタを思いついたら記録しておきます。タイトルとひとことメモだけでOKです。

```
/idea list                    # ネタ一覧を見る
/idea show プロジェクト名       # ネタの詳細を見る
/idea brush プロジェクト名      # 対話でネタを深掘りする
```

`/idea brush` では「何が面白い？」「誰に届けたい？」といった問いかけで対話しながら、アイデアの解像度を上げていきます。構成は作らず、ネタを温めることに集中します。

ネタが固まったら Step 1 へ進みます。ネタ帳をスキップして直接 `/outline` から始めることもできます。

### Step 1: アウトラインを作る

```
/outline 自分のプロジェクト名
```

対話しながら4フェーズを順番に進め、アウトプットの骨格を作ります。

| フェーズ              | やること                           | 生成されるファイル   |
| --------------------- | ---------------------------------- | -------------------- |
| Phase 1: コンテキスト | 発表の場・聴衆・制約を整理         | `context.md`         |
| Phase 2: ゴール       | 受け手に期待する行動・変化を決める | `goal.md`            |
| Phase 3: 構成作成     | 素材を章・項に落とし込む           | `outline.md`         |
| Phase 4: レビュー     | 4観点で点検し深掘り・言語化        | `outline.md`（更新） |

各フェーズは自動で次に進みます。Phase 4（レビュー）は納得いくまで何度でも繰り返せます。

### Step 2: コンテンツを仕上げる

アウトラインが完成したら、目的に応じたワークフローに進みます。

#### 記事を書く場合

```
/write 自分のプロジェクト名
```

| フェーズ          | やること                   | 生成されるファイル |
| ----------------- | -------------------------- | ------------------ |
| Phase 1: 執筆準備 | 文体・トーン・方針を決める | `write-plan.md`    |
| Phase 2: 本文執筆 | セクション単位で下書き     | `draft.md`         |
| Phase 3: 推敲     | 4観点でレビューし仕上げ    | `article.md`       |

`article.md` はそのままコピペで公開できる形式で出力されます。

### 途中から再開する

ワークフローはファイルの有無で進捗を自動判定します。途中で会話が切れても、もう一度 `/outline プロジェクト名` や `/write プロジェクト名` を実行すれば続きから再開できます。

### 個別フェーズの直接実行

特定のフェーズだけ実行したい場合は、個別のコマンドも使えます。

```
# アウトライン（骨格づくり）
/outline-context プロジェクト名   # コンテキスト設定
/outline-goal プロジェクト名      # ゴール設定
/outline-draft プロジェクト名     # 構成作成
/outline-refine プロジェクト名    # レビュー（繰り返し可）

# 記事執筆
/write-prepare プロジェクト名     # 執筆準備
/write-body プロジェクト名        # 本文執筆
/write-review プロジェクト名      # 推敲（繰り返し可）

# ワークフロー横断ツール
/humanize ファイルパス             # LLM表現パターンの検出・修正
```

## ファイル構成

```
output-flow/
├── .claude/skills/      # スキル定義（ワークフローのロジック）
├── examples/            # サンプルプロジェクト（使い方の参考用）
└── output/              # 成果物ディレクトリ（.gitignore で除外）
    └── <プロジェクト名>/
        ├── idea.md          # /idea で生成（ネタ帳）
        ├── outline/         # /outline で生成
        │   ├── context.md       # コンテキスト
        │   ├── goal.md          # ゴール
        │   ├── outline.md       # アウトライン
        │   ├── refine-log.md    # レビューログ
        │   └── input-log.md     # ユーザー入力ログ（ドリフト検出用）
        └── write/           # /write で生成
            ├── write-plan.md    # 執筆プラン
            ├── draft.md         # 下書き
            ├── article.md       # 最終版（公開用）
            ├── review-log.md    # レビューログ
            ├── humanize-log.md  # LLM表現チェックログ
            └── input-log.md     # ユーザー入力ログ（ドリフト検出用）
```

## 原稿を Git で管理する

`output/` はこのリポジトリの `.gitignore` で除外されているため、書いた原稿はそのままでは Git 管理されません。原稿もバージョン管理したい場合は、**プライベートリポジトリを別に作って `output/` を管理する**方法がおすすめです。

### 手順

1. GitHub でプライベートリポジトリを作成する

```bash
gh repo create output-flow_my-output --private
```

2. `output/` ディレクトリで Git を初期化し、リモートを接続する

```bash
cd output
git init
git branch -m main
git remote add origin git@github.com:<your-username>/output-flow_my-output.git
```

3. 原稿をコミットしてプッシュする

```bash
git add .
git commit -m "add: 原稿を追加"
git push -u origin main
```

以降は `output/` 内で通常の Git ワークフロー（`git add` → `git commit` → `git push`）が使えます。

> **Note:** `output/` は親リポジトリ（output-flow）とは完全に独立した Git リポジトリになります。親リポジトリの操作（`git status` や `git push`）が原稿に影響することはありません。

## コントリビュート

[CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。

## Tips

- プロジェクト名は日本語でもOKです（例: `/outline hogehogeブログ`）
- `/outline` をプロジェクト名なしで実行すると、既存プロジェクトの一覧から選べます
- `/idea` で記録したネタは `/outline` 開始時に自動で引き継がれます
- 各フェーズでは必ずユーザーの確認を取ってから次に進むので、安心して使えます
- レビュー系フェーズ（`/outline-refine`, `/write-review`）は何度でもやり直せます
