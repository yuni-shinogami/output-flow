---
name: write-review
description: 4つの観点（ゴール整合性・読みやすさ・独自価値・構成）で下書きを並列レビューし推敲する。何度でも繰り返し実行可能。「推敲」「レビュー」「write-review」で起動。
user-invocable: true
allowed-tools: Read, Write, Bash, Task
argument-hint: "<project-name>"
---

# Phase 3: 推敲・レビュー

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず以下を読み込む:
- `work/$ARGUMENTS/goal.md`
- `work/$ARGUMENTS/write-plan.md`
- `work/$ARGUMENTS/draft.md`

いずれか不在なら該当フェーズを案内。

## A. 並列レビュー

goal.md、write-plan.md、draft.mdの内容を読み取り、以下4つのサブエージェントを**1つのメッセージで同時に**Taskツール(subagent_type: general-purpose)で起動する。

各プロンプトのテンプレートは [review-prompts.md](review-prompts.md) を参照。実際の内容をテンプレートに埋め込んで渡す。

1. **ゴールとの整合性** — メッセージが伝わるか、目的から逸れていないか
2. **読みやすさ・文体の一貫性** — トーンのブレ、冗長な箇所、リズム
3. **独自価値の表現（最重要）** — 経験が活きているか、一般論に埋もれていないか
4. **構成・流れ** — 読者が離脱しそうな箇所、テンポ、つなぎの自然さ

## B. 結果統合

4つの結果が揃ったら:
1. 観点ごとに整理してユーザーに提示
2. 指摘に優先度（高/中/低）をつける
3. **独自価値の指摘を最優先**で対応

## C. 対話的な改善

レビュー結果を元にユーザーと対話し改善する:
- 具体的な修正案を提示
- ユーザーの意図を確認しながら調整
- 必要に応じて表現の選択肢を提示

## D. 最終版の保存

改善結果を反映して `work/$ARGUMENTS/article.md` に保存する。フォーマットは [templates/article.md](templates/article.md) を参照。

**重要: `article.md` にはレビューサマリやメタ情報を含めない。全選択→コピペでそのまま公開できる、公開本文のみのファイルにする。**

レビューサマリ（修正点・文体・独自価値のログ）は `work/$ARGUMENTS/review-log.md` に保存する。フォーマットは [templates/review-log.md](templates/review-log.md) を参照。

## 完了条件

- [ ] ゴールに沿ったメッセージが伝わる
- [ ] 文体が一貫している
- [ ] 独自の経験・体験が活きている
- [ ] 読者が最後まで読みたくなる流れ
- [ ] ユーザーが「これで公開できる」と感じている

改善余地があれば再度 `/write-review $ARGUMENTS` を案内。

このプロジェクトの振り返りを行いスキルを改善するには `/kaizen $ARGUMENTS` を実行してください。
