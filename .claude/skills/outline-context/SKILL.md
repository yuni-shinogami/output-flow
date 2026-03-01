---
name: outline-context
description: アウトラインのコンテキスト（発表の場・聴衆・制約）を対話形式で設定しcontext.mdに保存する。完了後に自動でoutline-goalを起動する。
user-invocable: true
allowed-tools: Read, Write, Bash, Skill
argument-hint: "<project-name>"
---

# Phase 1: コンテキスト設定

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
`output/$ARGUMENTS/outline/` が未作成なら作成する。

## ネタ帳の引き継ぎ

`output/$ARGUMENTS/idea.md` が存在する場合、内容を読み込みユーザーに提示する：
「このプロジェクトにはネタ帳の記録があります。コンテキスト設定の参考にします。」

ネタ帳の内容は質問の初期値や補足情報として活用するが、ユーザーの回答を優先する。

## ユーザーに聞くこと

以下4点を聞く（まとめて回答でも1つずつでもOK）：

1. **発表/公開の場** — どこで発表・公開するか
2. **聴衆/読者** — 想定読者の属性・関心
3. **制約条件** — 時間・文字数・フォーマットなど
4. **その場で求められること**（任意） — その場の趣旨に沿って求められる内容

## 回答後の処理

回答を整理し `output/$ARGUMENTS/outline/context.md` に保存する。フォーマットは [templates/context.md](templates/context.md) を参照。

保存後、整理した内容をユーザーに提示し「この内容でPhase 1を完了してよいか？」と確認する。

**重要: ユーザーが明示的に同意するまで次フェーズに進んではならない。追加・修正の要望があれば反映してから再度確認する。**

同意が得られたら「Phase 1 完了」と伝え、Skillツールで `outline-goal` を引数 `$ARGUMENTS` で起動する。
