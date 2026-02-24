# SVG生成ガイド — {{THEME_NAME}}

> テーマ CSS `{{THEME_NAME}}.css` のカラーパレットに準拠した SVG を生成するためのガイド。

## カラーパレット（SVG用）

SVG内で使用する色は以下に限定する:

| 用途 | 色コード | 備考 |
|:-----|:---------|:-----|
| メインカラー | `{{PRIMARY_COLOR}}` | 主要な要素、矢印、枠線 |
| ダーク | `{{DARK_COLOR}}` | 強調、見出し |
| ライト | `{{LIGHT_COLOR}}` | 背景、薄いアクセント |
| テキスト | `{{TEXT_COLOR}}` | ラベル、説明文 |
| 背景 | `{{BG_COLOR}}` | ボックス背景 |
| グレー | `{{GRAY_COLOR}}` | 補助線、薄い枠 |

## viewBox とサイズ

| 配置 | 推奨viewBox | 最大高さ |
|:-----|:------------|:---------|
| `img-full` | `0 0 800 400` | 480px |
| `img-text-right/left` | `0 0 400 350` | 420px |
| `img-center` | `0 0 600 350` | 400px |
| インライン（20行以下） | `0 0 400 250` | — |

## 品質ルール

- テキストは `font-family` を明示（`sans-serif` をフォールバックに）
- 線の太さ: 最低 `stroke-width="2"` （細すぎると見えない）
- フォントサイズ: 最低 `14px`（スライド上で読める最小サイズ）
- 白背景スライドでは薄い色（`{{LIGHT_COLOR}}`）のテキストを避ける
- グラデーション背景スライドでは外部SVGを避ける（配色が衝突しやすい）

## SVGテンプレート

```xml
<svg viewBox="0 0 800 400" xmlns="http://www.w3.org/2000/svg">
  <style>
    .label { font-family: sans-serif; font-size: 16px; fill: {{TEXT_COLOR}}; }
    .box { fill: {{BG_COLOR}}; stroke: {{PRIMARY_COLOR}}; stroke-width: 2; rx: 8; }
    .arrow { stroke: {{PRIMARY_COLOR}}; stroke-width: 2; fill: none; marker-end: url(#arrowhead); }
    .highlight { fill: {{LIGHT_COLOR}}; stroke: {{DARK_COLOR}}; stroke-width: 2; rx: 8; }
  </style>
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="{{PRIMARY_COLOR}}" />
    </marker>
  </defs>
  <!-- SVGコンテンツをここに -->
</svg>
```
