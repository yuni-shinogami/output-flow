---
name: slide-review
description: 5つの観点（ゴール整合性・視覚的明瞭さ・独自価値・プレゼンの流れ・デザインシステム準拠）でスライドを並列レビューし推敲する。ビジュアル検証オプション付き。「スライドレビュー」「slide-review」で起動。
user-invocable: true
allowed-tools: Read, Write, Bash, Task
argument-hint: "<project-name>"
---

# Phase 3: スライドレビュー

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず以下を読み込む:
- `output/$ARGUMENTS/outline/goal.md`
- `output/$ARGUMENTS/slide/slide-plan.md`
- `output/$ARGUMENTS/slide/slides.md`

いずれか不在なら該当フェーズを案内。

## A. 並列レビュー

goal.md、slide-plan.md、slides.mdの内容を読み取り、以下5つのサブエージェントを**1つのメッセージで同時に**Taskツール(subagent_type: general-purpose)で起動する。

各プロンプトのテンプレートは [review-prompts.md](review-prompts.md) を参照。実際の内容をテンプレートに埋め込んで渡す。

1. **ゴールとの整合性** — メッセージが伝わるスライド構成か、ゴールから逸れていないか
2. **視覚的明瞭さ** — 文字量、情報密度、1スライド1メッセージの原則、読みやすさ
   - Canva仕上げの場合: テンプレートレイアウトに合わない情報量過多スライドがないか
3. **独自価値の表現（最重要）** — 経験が活きているか、一般論スライドになっていないか
   - Canva仕上げの場合: ビジュアルで強調すべき独自体験の箇所を明示
4. **プレゼンの流れ** — テンポ、時間配分、聴衆の集中力、起承転結
5. **デザインシステム準拠** — `.claude/skills/slide/themes/starter/docs/style-guide.md` と `.claude/skills/slide/themes/starter/docs/patterns.md` を読み込んでチェック
   - 定型構造の遵守: slide-plan.mdの構成パターン（問題解決型/体験談型/PREP型）に合った流れになっているか
   - ブリッジスライドの効果: セクション転換にブリッジスライドが適切に配置されているか。ブリッジのメッセージが1行で簡潔か
   - 段階的ビルドアップの活用: 複雑な概念や図解に段階的な情報開示が使われているか。ビルドアップが冗長になりすぎていないか
   - おまけ/宣伝の効果: クロージング後のおまけ/宣伝が自然か（あれば）
   - Canva仕上げの場合: セクション区切りでのビジュアル演出機会の提案

## B. 結果統合

5つの結果が揃ったら:
1. 観点ごとに整理してユーザーに提示
2. 指摘に優先度（高/中/低）をつける
3. **独自価値の指摘を最優先**で対応

## C. 対話的な改善

レビュー結果を元にユーザーと対話し改善する:
- 具体的な修正案を提示（スライド単位で）
- ユーザーの意図を確認しながら調整
- 必要に応じてスライドの分割・統合・順序変更を提案

## D. 最終版の保存

改善結果を反映して `output/$ARGUMENTS/slide/slides.md` を更新する。フォーマットは [templates/slides-final.md](templates/slides-final.md) を参照。

**重要: 最終版の `slides.md` はMarp形式として有効で、そのままプレゼンに使える状態にする。**

レビューサマリは `output/$ARGUMENTS/slide/slide-review-log.md` に保存する。フォーマットは [templates/slide-review-log.md](templates/slide-review-log.md) を参照。

## E. ビジュアル検証

レビューの改善を反映した後、スクリーンショットでビジュアル確認を行う。

1. `./.claude/skills/slide/scripts/take-screenshots.sh output/$ARGUMENTS/slide/slides.md output/$ARGUMENTS/slide/screenshots/` でPNG生成
2. 生成されたPNG画像をClaude Visionで全スライド確認（5枚ずつバッチで読み込む）
3. 以下をチェック:
   - テキストのはみ出し・切れ（特にemphasis-detail、content+SVGのスライド）
   - フォントサイズが小さすぎるスライド
   - レイアウト崩れ（要素の重なり、余白の不均一）
   - グラデーション背景上のテキスト可読性
   - SVG/画像の表示（外部ファイル参照が正しいか）
4. 問題があれば修正し、該当スライドのみ再生成して確認

スクリーンショットは `output/$ARGUMENTS/slide/screenshots/` に保存され、プロジェクトと一緒に管理される。

## F. PDF出力

ビジュアル検証が完了したら、発表用PDFをプロジェクト内に生成する:
```bash
./.claude/skills/slide/scripts/export-pdf.sh output/$ARGUMENTS/slide/slides.md output/$ARGUMENTS/slide/
```
生成先: `output/$ARGUMENTS/slide/slides.pdf`

## 完了条件

- [ ] ゴールに沿ったメッセージがスライドで伝わる
- [ ] 1スライド1メッセージが守られている
- [ ] 独自の経験・体験が活きている
- [ ] 時間配分が適切でテンポが良い
- [ ] slide-plan.mdの構成パターンに合った流れが守られている
- [ ] ブリッジスライドがセクション転換に適切に配置されている
- [ ] 段階的ビルドアップが効果的に使われている（該当箇所があれば）
- [ ] デザインシステムに準拠している（`_class:` 付与、カラーパレット遵守）
- [ ] SVG図解がデザインシステムのカラーパレットに準拠している（該当箇所があれば）
- [ ] 画像・SVGがスライド内に適切に収まっている（該当箇所があれば）
- [ ] ユーザーが「これで発表できる」と感じている

改善余地があれば再度 `/slide-review $ARGUMENTS` を案内。

このプロジェクトの振り返りを行いスキルを改善するには `/kaizen $ARGUMENTS` を実行してください。
