# スタイルガイド — {{THEME_NAME}}

> このドキュメントはテーマCSS `{{THEME_NAME}}.css` と整合しています。

## カラーパレット

| 名前 | 値 | CSS変数 | 用途 |
|:-----|:---|:--------|:-----|
| メインカラー | `{{PRIMARY_COLOR}}` | `--color-primary` | 見出し、アクセント、ヘッダーバー |
| ダーク | `{{DARK_COLOR}}` | `--color-primary-dark` | グラデーション始点 |
| ライト | `{{LIGHT_COLOR}}` | `--color-primary-light` | グラデーション終点 |
| テキスト | `{{TEXT_COLOR}}` | `--color-black` | 本文テキスト |
| 背景 | `{{BG_COLOR}}` | `--color-white` | スライド背景 |
| グレー | `{{GRAY_COLOR}}` | `--color-gray` | 区切り線、装飾 |

### グラデーション

```css
background: linear-gradient(135deg, {{DARK_COLOR}} 0%, {{LIGHT_COLOR}} 100%);
```

使用箇所: cover, bridge, summary 等のグラデーション背景パターン

## タイポグラフィ

| 要素 | フォント | サイズ | ウェイト |
|:-----|:---------|:-------|:---------|
| 基本 | {{FONT_FAMILY}} | 1em | 400 |
| h1（強調系） | 同上 | 3.2em | 900 |
| h1（グラデ背景） | 同上 | 2.8-3em | 900 |
| h2 | 同上 | 1.6em | 700 italic |
| 箇条書き | 同上 | 1.3em | 400 |
| コード | monospace | 0.9em | 400 |

## TailwindCSS カラー設定

slides.md の `<script>` 内で使用:

```javascript
tailwind.config = {
  corePlugins: { preflight: false },
  theme: {
    extend: {
      colors: {
        'brand-primary': '{{PRIMARY_COLOR}}',
        'brand-dark': '{{DARK_COLOR}}',
        'brand-light': '{{LIGHT_COLOR}}',
        'brand-black': '{{TEXT_COLOR}}',
        'brand-gray': '{{GRAY_COLOR}}',
      },
    },
  },
}
```

## NGパターン

### テキスト量

- 箇条書き6項目以上 → スライド分割を検討
- コードブロック10行以上 → 抜粋に絞る
- 1スライドに複数メッセージ → 1スライド1メッセージの原則

### 孤立文字の防止

大きいフォントの h1 は、パターンごとの1行文字数上限を意識する。超える場合は `<br>` で意味のまとまりごとに改行位置を制御。

| パターン | h1の1行上限（目安） |
|:---------|:---------------------|
{{CHAR_LIMIT_TABLE}}

### カラーの誤用

- グラデーション背景上に `--color-black` テキストを使わない
- 白背景上に `--color-white` テキストを使わない
- アクセント色をテキスト本文に使わない（視認性低下）
