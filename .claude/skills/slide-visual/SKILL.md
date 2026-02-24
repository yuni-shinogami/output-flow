---
name: slide-visual
description: 既存のslides.mdにSVG図解・画像を追加しビジュアルを強化する。「スライドビジュアル」「slide-visual」で起動。
user-invocable: true
allowed-tools: Read, Write, Bash
argument-hint: "<project-name>"
---

# Phase 2.3: スライドビジュアル強化

プロジェクト: **$ARGUMENTS**

`$ARGUMENTS` 未指定なら案内して終了。
まず以下を読み込む:
- `output/$ARGUMENTS/slide/slides.md`
- `output/$ARGUMENTS/slide/slide-plan.md`
- `output/$ARGUMENTS/outline/goal.md`
- `docs/svg-guide.md`（SVG生成ガイド）
- `docs/patterns.md`（画像レイアウトクラスのセクション）

いずれか不在なら該当フェーズを案内。

## 処理フロー

### 1. 分析と提案

各スライドを走査し、ビジュアル強化の候補をテーブル形式で提示する:

| スライド番号 | 現在の内容 | 提案するSVG種類 | レイアウトクラス | 概要 |
|:------------|:----------|:---------------|:---------------|:-----|

提案の判断基準:
- プロセス・手順の説明 → **フロー図SVG**
- 比較・対照 → **比較チャートSVG**
- システム構造・レイヤー → **アーキテクチャ図SVG**
- 時系列・経緯 → **タイムラインSVG**
- 関連概念の整理 → **概念マップSVG**

### 2. ユーザー確認

提案テーブルを提示し、以下を確認する:
- 各提案の承認 / 却下 / 修正
- 追加の要望

**重要: ユーザーの明示的な承認なしにSVGを生成・配置しない。**

### 3. SVG生成と配置

承認された提案ごとに:
1. `docs/svg-guide.md` のカラーパレット・viewBox・品質ルールに従ってSVGを生成
2. 20行以下 → `slides.md` にインライン配置、20行超 → `output/$ARGUMENTS/slide/images/` に外部ファイル保存
3. 画像レイアウトクラス（`img-text-right`, `img-full` 等）を使って `slides.md` 内に配置
4. 1つ生成するごとにユーザーに確認（まとめて全部ではなく段階的に）

### 4. 確認

すべてのSVG配置が完了したら:
- 変更サマリを提示（追加したSVGの一覧）
- スクリーンショットでのビジュアル検証を案内（`./scripts/take-screenshots.sh`）

## 制約

- **追加しないスライド:** bridge, cover, section-box, section-line にはビジュアルを追加しない
- **数量目安:** 1プレゼンあたり3-8個程度（多すぎると情報過多）
- **カラーパレット厳守:** オレンジ系（`#F5A623`, `#F09819`, `#F7CE68`）+ グレー・白・黒のみ
- **既存コンテンツ優先:** SVG追加によりテキストが読みにくくなる場合は追加しない
