# SVG生成ガイド

スライド用SVGを生成するときのリファレンス。

## カラーパレット制約

`starter-theme.css` の `:root` 変数と同一。SVG内で使用できる色はこれらのみ。

| 名前 | HEX | 用途 |
|------|-----|------|
| Primary | `#F5A623` | メインアクセント、矢印、枠線、強調 |
| Dark | `#F09819` | グラデーション始点、濃いアクセント |
| Light | `#F7CE68` | グラデーション終点、背景塗り |
| Text | `#333333` | テキスト、ラベル |
| White | `#ffffff` | 白背景、白テキスト |
| Gray | `#e0e0e0` | 補助線、薄い背景、区切り線 |

**禁止:** 上記パレット外の色。

## フォント指定

```
font-family="'Noto Sans JP', sans-serif"
```

- 最小フォントサイズ: 14px
- `font-weight`: 400（通常）または 700（太字）

## viewBoxサイズ規約

Marp 16:9（1280x720）基準。

| 用途 | viewBox | レイアウトクラス |
|------|---------|-----------------|
| 全幅図 | `0 0 1100 500` | `img-full` |
| 半幅（テキスト横配置） | `0 0 500 400` | `img-text-left` / `img-text-right` |
| アイコン / バッジ | `0 0 80 80` or `0 0 120 40` | インライン |

## インライン vs 外部ファイル

| 条件 | 配置方法 |
|------|---------|
| 20行以下の小さな図 | インライン（`slides.md` 内に直接記述） |
| 複雑なフロー図・アーキテクチャ図 | 外部ファイル（`images/*.svg`） |

外部ファイルの命名規則:
- `flow-[説明].svg` — フロー図
- `arch-[説明].svg` — アーキテクチャ図
- `compare-[説明].svg` — 比較チャート
- `diagram-[説明].svg` — その他の図

## SVGテンプレート

### フロー図（左→右）

```svg
<svg viewBox="0 0 1100 500" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .box { fill: #ffffff; stroke: #F5A623; stroke-width: 2; rx: 12; }
    .box-accent { fill: #F5A623; stroke: none; rx: 12; }
    .arrow { fill: none; stroke: #F09819; stroke-width: 3; marker-end: url(#arrowhead); }
  </style>
  <defs>
    <marker id="arrowhead" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#F09819" />
    </marker>
  </defs>

  <rect class="box-accent" x="50" y="200" width="200" height="80" />
  <text x="150" y="245" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">ステップ1</text>

  <line class="arrow" x1="260" y1="240" x2="340" y2="240" />

  <rect class="box" x="350" y="200" width="200" height="80" />
  <text x="450" y="245" text-anchor="middle" font-size="18" font-weight="700">ステップ2</text>

  <line class="arrow" x1="560" y1="240" x2="640" y2="240" />

  <rect class="box-accent" x="650" y="200" width="200" height="80" />
  <text x="750" y="245" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">ステップ3</text>
</svg>
```

### 比較チャート（2カラム対照）

```svg
<svg viewBox="0 0 1100 500" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .header { fill: #F5A623; rx: 12; }
    .col { fill: #ffffff; stroke: #e0e0e0; stroke-width: 2; rx: 12; }
  </style>

  <rect class="header" x="50" y="30" width="450" height="60" />
  <text x="275" y="68" text-anchor="middle" fill="#ffffff" font-size="22" font-weight="700">Before</text>
  <rect class="col" x="50" y="110" width="450" height="350" />

  <text x="550" y="270" text-anchor="middle" font-size="28" font-weight="900" fill="#F5A623">VS</text>

  <rect class="header" x="600" y="30" width="450" height="60" />
  <text x="825" y="68" text-anchor="middle" fill="#ffffff" font-size="22" font-weight="700">After</text>
  <rect class="col" x="600" y="110" width="450" height="350" />
</svg>
```

## 品質ルール

- **角丸:** `rx="12"`（テーマの `border-radius: 12px` と統一）
- **線幅:** 2-3px
- **フィルター禁止:** `filter`（ドロップシャドウ等）は使わない
- **SVGは自己完結:** 外部画像参照なし
- **テキストは最小限:** 1ボックスに1-2行、図全体で10-15要素が上限
- **viewBox固定:** `width` / `height` 属性は指定しない（Marpのレスポンシブに任せる）
