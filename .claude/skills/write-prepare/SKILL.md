---
name: write-prepare
description: アウトラインを読み込み、文体・トーン・執筆方針を対話形式で決定しwrite-plan.mdに保存する。完了後に自動でwrite-bodyを起動する。「執筆準備」で起動。
user-invocable: true
allowed-tools: Read, Write, Bash, Skill
argument-hint: "<project-name>"
---

# Phase 1: 執筆準備

**重要: `$ARGUMENTS` にプロジェクト名が含まれる場合、CLAUDE.mdの命名規則に従いディレクトリを解決すること。**

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず `output/$ARGUMENTS/outline/context.md`、`output/$ARGUMENTS/outline/goal.md`、`output/$ARGUMENTS/outline/outline.md` を読み込む。いずれか不在なら該当フェーズを案内。

## ユーザーに聞くこと

アウトラインの内容を踏まえて、以下を聞く（まとめて回答でも1つずつでもOK）:

1. **文体・トーン** — カジュアル/フォーマル、一人称の表記（私/僕/自分など）、語尾のスタイル（です・ます/だ・である/口語体）
2. **参考スタイル**（任意） — 参考にしたい記事のURLやスタイルの説明
3. **特別な制約**（任意） — 文字数目安、フォーマット要件（見出しレベル、画像挿入箇所など）

## 回答後の処理

### 入力ログの保存

ユーザーの回答を受け取ったら、**構造化する前に**、発言をそのまま
`output/$ARGUMENTS/write/input-log.md` に記録する。
テンプレート（[templates/input-log.md](templates/input-log.md)）に従い新規作成（やり直し時は上書き）。
引用記法で原文のまま記録。

### write-plan.md の保存

回答とアウトラインの内容を統合し、`output/$ARGUMENTS/write/write-plan.md` に保存する。フォーマットは [templates/write-plan.md](templates/write-plan.md) を参照。

write-plan.mdには以下を含める:
- 文体方針（トーン、人称、語尾）
- アウトラインの各章→記事セクションの対応表
- 執筆上の注意点（独自価値を活かすポイント、避けるべきこと）

保存後、整理した内容をユーザーに提示し「この方針でPhase 1を完了してよいか？」と確認する。

**重要: ユーザーが明示的に同意するまで次フェーズに進んではならない。追加・修正の要望があれば反映してから再度確認する。**

同意が得られたら「Phase 1 完了」と伝え、Skillツールで `write-body` を引数 `$ARGUMENTS` で起動する。
