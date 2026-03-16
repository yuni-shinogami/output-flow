---
name: slide-style
description: 既存のslides.mdにデザインシステム（カスタムテーマ+TailwindCSS+レイアウトパターン）を適用する。パターン選定を提案→確認→適用の対話形式で進める。「スライドスタイル」「slide-style」で起動。
user-invocable: true
allowed-tools: Read, Write, Bash
argument-hint: "<project-name>"
---

# スライドスタイル適用

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず以下を読み込む:
- `output/$ARGUMENTS/slide/slides.md`
- `.claude/skills/slide/themes/starter/docs/style-guide.md`
- `.claude/skills/slide/themes/starter/docs/patterns.md`

slides.md が不在なら `/slide-draft` を案内。`.claude/skills/slide/themes/starter/docs/` が不在なら「デザインシステムが未構築」と案内。

## 処理フロー

### ステップ1: 現状分析

slides.md を読み込み、以下を分析してユーザーに提示:
- 総スライド数
- `_class:` が付与されているスライド数 / 未付与数
- 使用されているパターン一覧
- frontmatter のテーマ設定（`theme: starter-theme` かどうか）
- TailwindCSS scriptタグの有無

### ステップ2: パターン選定提案

`_class:` が未付与のスライドについて、`.claude/skills/slide/themes/starter/docs/patterns.md` のカタログから最適なパターンを提案する。

各スライドの提案を表形式で提示:

| # | スライド見出し | 現在のclass | 提案パターン | 理由 |
|---|---------------|------------|-------------|------|

ユーザーに確認を求める。修正要望があれば反映。

### ステップ3: スタイル適用

ユーザーの承認後、以下を一括適用:

1. **frontmatter更新**: `theme: starter-theme`, `paginate: false`, `size: 16:9`
2. **TailwindCSS boilerplate追加**（未存在の場合）:
   ```html
   <script src="../../../.claude/skills/slide/js/tailwindcss.js"></script>
   <script>
   tailwind.config = {
     corePlugins: { preflight: false },
     theme: { extend: { colors: { ... }, fontSize: { ... } } },
   }
   </script>
   ```
3. **`_class:` 付与**: 各スライドに承認済みパターンの `<!-- _class: [name] -->` を追加
4. **HTML構造調整**: `self-intro` パターンなど、HTML構造が必要なスライドは構造を付与

### ステップ4: 確認

適用後の slides.md を保存し、変更サマリをユーザーに提示。

ビルド・プレビューを案内:
- `./.claude/skills/slide/scripts/build.sh output/$ARGUMENTS/slide/slides.md` でHTML出力
- `./.claude/skills/slide/scripts/preview.sh output/$ARGUMENTS/slide/slides.md` でプレビュー

## 注意事項

- 既に `_class:` が付与されているスライドは変更しない（ユーザーが明示的に要望した場合を除く）
- スタイルガイドのNGパターンに該当する記述があれば指摘する
- 適用後も `slides.md` はMarp形式として有効であること
