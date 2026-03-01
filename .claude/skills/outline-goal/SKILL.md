---
name: outline-goal
description: アウトラインのゴール（受け手に期待する行動・変化）を対話形式で設定しgoal.mdに保存する。完了後に自動でoutline-draftを起動する。
user-invocable: true
allowed-tools: Read, Write, Bash, Skill
argument-hint: "<project-name>"
---

# Phase 2: ゴール設定

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず `output/$ARGUMENTS/outline/context.md` を読み込む。存在しなければ先にPhase 1を案内。

## ユーザーに聞くこと

コンテキストを踏まえて、以下を聞く：

1. **受け手に期待する行動/変化** — 何かを始める？考え方を変える？行動を変える？
2. **語りのスタンス** — 以下のどれに近いか：
   - A. **結論を届けたい**: 自分なりの主張があり、それを伝えたい
   - B. **一緒に考えたい**: まだ結論が見えていない。素材を整理しながら発見したい
   - C. **体験を共有したい**: 結論よりも体験そのものを共有したい
3. **核となるメッセージ / 探りたいテーマ・問い**
   - A/Cの場合: 伝えるべきことの核
   - Bの場合: 今モヤモヤしていること、探りたい問い。「まだ言語化できない」でもOK

## 回答後の処理

### 入力ログの保存

ユーザーの回答を受け取ったら、**構造化する前に**、発言をそのまま
`output/$ARGUMENTS/outline/input-log.md` の Phase 2 セクションに追記する。
ファイル未存在ならテンプレート（[templates/input-log.md](../outline-context/templates/input-log.md)）に従い新規作成。引用記法で原文のまま記録。

### goal.md の保存

回答を整理し `output/$ARGUMENTS/outline/goal.md` に保存する。フォーマットは [templates/goal.md](templates/goal.md) を参照。

コンテキストとの整合性も簡潔に記載する。

保存後、整理した内容をユーザーに提示し「この内容でPhase 2を完了してよいか？」と確認する。

**重要: ユーザーが明示的に同意するまで次フェーズに進んではならない。追加・修正の要望があれば反映してから再度確認する。**

同意が得られたら「Phase 2 完了」と伝え、Skillツールで `outline-draft` を引数 `$ARGUMENTS` で起動する。
