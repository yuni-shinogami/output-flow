# スタイルガイド

> starter-theme のカラーパレット・タイポグラフィ・NGルールのリファレンス。
> カスタマイズは `/slide-theme` で独自テーマを作成してください。

## カラーパレット

### プライマリカラー
| 名前 | HEX | CSS変数 | 用途 |
|------|-----|---------|------|
| Orange | `#F5A623` | `--color-orange` | メインアクセント、ヘッダーバー、箇条書きマーカー |
| Orange Dark | `#F09819` | `--color-orange-dark` | グラデーション始点 |
| Orange Light | `#F7CE68` | `--color-orange-light` | グラデーション終点 |

### グラデーション
```css
background: linear-gradient(135deg, #F09819 0%, #F7CE68 100%);
```
使用箇所: cover, section-box, section-line, bridge, result, summary

### テキストカラー
| 名前 | HEX | CSS変数 | 用途 |
|------|-----|---------|------|
| Black | `#333333` | `--color-black` | 本文テキスト |
| White | `#ffffff` | `--color-white` | グラデーション背景上のテキスト |
| Gray | `#e0e0e0` | `--color-gray` | 罫線、グリッド背景、ツリーの縦線 |

### カラールール
- スライド背景は「白」か「グラデーション」の2択
- アクセント色はオレンジ系のみ使用
- テキスト色は `#333333`（白背景）と `#ffffff`（グラデーション背景）
- グラデーション背景上のテキストは必ず白

## タイポグラフィ

### フォントスタック
```
"Noto Sans JP", "Hiragino Kaku Gothic ProN", "Yu Gothic", sans-serif
```

### サイズ階層（em基準）
| レベル | サイズ | weight | 用途 |
|--------|--------|--------|------|
| 特大 | 4em | 900 | title の h1 |
| 大 | 3em〜3.2em | 900 | cover h1, emphasis h1, summary h1 |
| 中大 | 2.4em〜2.8em | 900 | section h1, bridge h1, emphasis-detail h1 |
| 中 | 1.6em | 700 | コンテンツ h2 |
| 標準 | 1.3em | 400/700 | 箇条書き項目 |
| 小 | 1.1em〜1.2em | 400 | 補助テキスト |
| 極小 | 0.85em〜0.95em | 400 | ネスト項目 |

### 行間
- ベース行間: `1.5`（section デフォルト）
- 箇条書き: `1.4`（padding 12px と合わせて適切な間隔）

### 孤立文字（orphan character）の防止

大きいフォントの h1 は `<br>` で改行位置を制御する。1〜2文字だけ次の行にはみ出す「孤立文字」を防ぐ。

**パターン別の1行文字数上限**（全角文字基準）:

| パターン | font-size | 1行の目安 |
|---------|-----------|----------|
| title h1 | 4em | ~9文字 |
| cover h1 | 3em | ~14文字 |
| emphasis h1 | 3.2em | ~11文字 |
| bridge h1 | 2.8em | ~13文字 |
| emphasis-detail h1 | 2.4em | ~15文字 |
| section-box h1 | 2.8em | ~13文字 |
| section-line h1 | 2.8em | ~13文字 |
| summary ol li | 1.3em | ~18文字 |
| content h2 | 1.6em | ~25文字 |
| content li | 1.3em | ~30文字 |

### 装飾
- **太字イタリック**: コンテンツ系のh2（`font-weight: 700; font-style: italic`）
- **ストローク**: title の h1（`-webkit-text-stroke: 2px`）
- **太字イタリック**: summary h1

## スペーシング

### セクション padding
| パターン | padding |
|---------|---------|
| 標準（白背景系） | `60px 80px` |
| グラデーション中央配置系 | `0`〜`80px 120px` |
| summary | `50px 100px` |

### 要素間隔
- h2 → コンテンツ: `margin-bottom: 24px`
- 箇条書き項目間: `padding: 12px 0`
- ネスト項目間: `padding: 6px 0`
- 間隔は 8px の倍数を基本とする（8, 16, 24, 40, 60, 80px）

## 装飾パターン

### ヘッダーバー
- コンテンツ系スライドの左上に表示
- オレンジ背景 + 白文字、`width: fit-content`

### 白枠ボックス
- section-box, result, summary で使用
- `border: 4px solid white; border-radius: 12px`

### 箇条書きマーカー
- オレンジ色の `▶`（`content: "▶"; color: var(--color-orange)`）

### ツリー構造の縦線
- `border-left: 3px solid var(--color-gray)`

### グリッド背景
- title スライド専用、50px間隔の薄いグレー線

## TailwindCSS ユーティリティ

カスタムテーマクラス（`_class:`）で基本レイアウトを決め、TailwindCSS で微調整する。

### 推奨する使い方
- `grid`, `flex` — 要素配置
- `bg-brand-orange`, `text-brand-orange` — テーマカラー適用
- `gap-*`, `p-*`, `m-*` — スペーシング
- `text-slide-*` — フォントサイズ微調整（em ベース）

### 避けるべき使い方
- テーマカラー以外の `bg-*` / `text-*`
- px ベースのフォントサイズ（em ベースの `text-slide-*` を使う）
- カスタムテーマの font-family / weight の上書き

## NGパターン

- グラデーション背景に黒テキスト
- 白背景にオレンジ以外のアクセント色
- 1スライドに3色以上のアクセント色
- ヘッダーバーをグラデーション背景スライドに配置
- 箇条書き6項目以上（5項目以内が目安）
- `font-size` を px 指定（em を使うこと）
- ブリッジスライドに4行以上のテキスト
- 1スライドに複数の主張を詰め込む（1スライド1メッセージ）
- SVGにパレット外の色を使用
- インラインSVGが20行超（外部ファイル化すべき）

## SVG / 画像ガイドライン

- 詳細は `svg-guide.md` を参照
- カラー制約: SVG内の色もオレンジ系のみ
- 配置: 画像レイアウトクラス（`img-text-right` 等）を使用（`patterns.md` 参照）
