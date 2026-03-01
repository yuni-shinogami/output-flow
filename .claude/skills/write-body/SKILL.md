---
name: write-body
description: アウトラインと執筆プランに基づき、セクション単位で本文を執筆しdraft.mdに保存する。完了後に自動でwrite-reviewを起動する。「本文執筆」「下書き」で起動。
user-invocable: true
allowed-tools: Read, Write, Bash, Skill
argument-hint: "<project-name>"
---

# Phase 2: 本文執筆

**重要: `$ARGUMENTS` にプロジェクト名が含まれる場合、CLAUDE.mdの命名規則に従いディレクトリを解決すること。**

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず以下を読み込む:
- `output/$ARGUMENTS/outline/context.md`
- `output/$ARGUMENTS/outline/goal.md`
- `output/$ARGUMENTS/outline/outline.md`
- `output/$ARGUMENTS/write/write-plan.md`

いずれか不在なら該当フェーズを案内。

## 執筆プロセス

### ステップ1: 全体構成の提示

write-plan.mdの構成対応表をもとに、記事全体の見出し構成を提示する。

### ステップ2: セクション単位で執筆

アウトラインの章順に、1章ずつ執筆してユーザーに提示する。

各セクションの執筆で意識すること:
- write-plan.mdの文体方針に従う
- アウトラインの「ポイント」「具体例」「独自性」を活かす
- 独自の経験・エピソードは具体的に描写する
- 一般論は最小限にし、自分の言葉で語る

**各セクション提示後、ユーザーに方向性を確認する。** 修正要望があれば反映してから次のセクションに進む。

### ステップ3: 全体統合

全セクション完了後、通しで読んだときの流れを確認し、必要に応じてつなぎの文を調整する。

### ステップ4: 保存

完成した下書きを `output/$ARGUMENTS/write/draft.md` に保存する。フォーマットは [templates/draft.md](templates/draft.md) を参照。

ユーザーに全体を提示し「この下書きでPhase 2を完了してよいか？」と確認する。

**重要: ユーザーが明示的に同意するまで次フェーズに進んではならない。修正要望があれば反映してから再度確認する。**

同意が得られたら「Phase 2 完了」と伝え、Skillツールで `write-review` を引数 `$ARGUMENTS` で起動する。
