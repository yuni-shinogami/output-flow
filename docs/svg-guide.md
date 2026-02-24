# SVG生成ガイド

Claudeがスライド用SVGを生成するときに参照するリファレンス文書。

## カラーパレット制約

`theme/custom-theme.css` の `:root` 変数と同一。SVG内で使用できる色はこれらのみ。

| 名前 | HEX | 用途 |
|------|-----|------|
| Primary | `#F5A623` | メインアクセント、矢印、枠線、強調 |
| Dark | `#F09819` | グラデーション始点、濃いアクセント |
| Light | `#F7CE68` | グラデーション終点、背景塗り |
| Text | `#333333` | テキスト、ラベル |
| White | `#ffffff` | 白背景、白テキスト |
| Gray | `#e0e0e0` | 補助線、薄い背景、区切り線 |

**禁止:** 上記パレット外の色。青、緑、赤などは使用不可。

## フォント指定

```
font-family="'Noto Sans JP', sans-serif"
```

- 最小フォントサイズ: 14px
- 日本語テキストには必ず `Noto Sans JP` を指定
- `font-weight` は 400（通常）または 700（太字）

## viewBoxサイズ規約

Marp 16:9（1280x720）基準でviewBoxを設定する。

| 用途 | viewBox | 使用レイアウトクラス |
|------|---------|---------------------|
| 全幅図（フロー図、アーキテクチャ図等） | `0 0 1100 500` | `img-full` |
| 半幅（テキスト横配置） | `0 0 500 400` | `img-text-left` / `img-text-right` |
| アイコン / バッジ | `0 0 80 80` or `0 0 120 40` | インライン配置 |

## インライン vs 外部ファイルの判断基準

| 条件 | 配置方法 | 保存先 |
|------|---------|--------|
| 20行以下のアイコン・バッジ・小装飾 | インライン（`slides.md` 内に直接記述） | - |
| フロー図・アーキテクチャ図等の複雑なSVG | 外部ファイル | `work/<project>/images/*.svg` |

外部ファイルの命名規則:
- `flow-[説明].svg` — フロー図
- `arch-[説明].svg` — アーキテクチャ図
- `map-[説明].svg` — 概念マップ
- `timeline-[説明].svg` — タイムライン
- `compare-[説明].svg` — 比較チャート
- `diagram-[説明].svg` — その他の図

## SVGテンプレート

### 1. フロー図（左→右）

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

  <!-- ボックス1 -->
  <rect class="box-accent" x="50" y="200" width="200" height="80" />
  <text x="150" y="245" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">ステップ1</text>

  <!-- 矢印 -->
  <line class="arrow" x1="260" y1="240" x2="340" y2="240" />

  <!-- ボックス2 -->
  <rect class="box" x="350" y="200" width="200" height="80" />
  <text x="450" y="245" text-anchor="middle" font-size="18" font-weight="700">ステップ2</text>

  <!-- 矢印 -->
  <line class="arrow" x1="560" y1="240" x2="640" y2="240" />

  <!-- ボックス3 -->
  <rect class="box-accent" x="650" y="200" width="200" height="80" />
  <text x="750" y="245" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">ステップ3</text>
</svg>
```

### 2. アーキテクチャ / レイヤー図（積み重ね矩形）

```svg
<svg viewBox="0 0 1100 500" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .layer { rx: 12; stroke: none; }
  </style>

  <!-- 上層 -->
  <rect class="layer" x="200" y="50" width="700" height="100" fill="#F5A623" />
  <text x="550" y="110" text-anchor="middle" fill="#ffffff" font-size="20" font-weight="700">プレゼンテーション層</text>

  <!-- 中層 -->
  <rect class="layer" x="200" y="180" width="700" height="100" fill="#F7CE68" />
  <text x="550" y="240" text-anchor="middle" font-size="20" font-weight="700">ビジネスロジック層</text>

  <!-- 下層 -->
  <rect class="layer" x="200" y="310" width="700" height="100" fill="#e0e0e0" />
  <text x="550" y="370" text-anchor="middle" font-size="20" font-weight="700">データアクセス層</text>
</svg>
```

### 3. 概念マップ（中心ノード + 放射接続）

```svg
<svg viewBox="0 0 1100 500" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .center { fill: #F5A623; rx: 12; }
    .node { fill: #ffffff; stroke: #F5A623; stroke-width: 2; rx: 12; }
    .link { stroke: #F09819; stroke-width: 2; fill: none; }
  </style>

  <!-- 接続線（ノードの下に描画） -->
  <line class="link" x1="550" y1="250" x2="250" y2="100" />
  <line class="link" x1="550" y1="250" x2="850" y2="100" />
  <line class="link" x1="550" y1="250" x2="250" y2="400" />
  <line class="link" x1="550" y1="250" x2="850" y2="400" />

  <!-- 中心ノード -->
  <rect class="center" x="450" y="210" width="200" height="80" />
  <text x="550" y="258" text-anchor="middle" fill="#ffffff" font-size="20" font-weight="700">中心概念</text>

  <!-- 周辺ノード -->
  <rect class="node" x="150" y="60" width="200" height="80" />
  <text x="250" y="108" text-anchor="middle" font-size="16" font-weight="700">関連概念A</text>

  <rect class="node" x="750" y="60" width="200" height="80" />
  <text x="850" y="108" text-anchor="middle" font-size="16" font-weight="700">関連概念B</text>

  <rect class="node" x="150" y="360" width="200" height="80" />
  <text x="250" y="408" text-anchor="middle" font-size="16" font-weight="700">関連概念C</text>

  <rect class="node" x="750" y="360" width="200" height="80" />
  <text x="850" y="408" text-anchor="middle" font-size="16" font-weight="700">関連概念D</text>
</svg>
```

### 4. タイムライン（水平線 + マイルストーン）

```svg
<svg viewBox="0 0 1100 500" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .timeline { stroke: #e0e0e0; stroke-width: 4; }
    .milestone { fill: #F5A623; }
    .label { font-size: 16px; font-weight: 700; }
    .desc { font-size: 14px; }
  </style>

  <!-- タイムライン本線 -->
  <line class="timeline" x1="100" y1="250" x2="1000" y2="250" />

  <!-- マイルストーン1 -->
  <circle class="milestone" cx="200" cy="250" r="16" />
  <text class="label" x="200" y="210" text-anchor="middle">Phase 1</text>
  <text class="desc" x="200" y="300" text-anchor="middle">説明テキスト</text>

  <!-- マイルストーン2 -->
  <circle class="milestone" cx="450" cy="250" r="16" />
  <text class="label" x="450" y="210" text-anchor="middle">Phase 2</text>
  <text class="desc" x="450" y="300" text-anchor="middle">説明テキスト</text>

  <!-- マイルストーン3 -->
  <circle class="milestone" cx="700" cy="250" r="16" />
  <text class="label" x="700" y="210" text-anchor="middle">Phase 3</text>
  <text class="desc" x="700" y="300" text-anchor="middle">説明テキスト</text>

  <!-- マイルストーン4 -->
  <circle class="milestone" cx="950" cy="250" r="16" />
  <text class="label" x="950" y="210" text-anchor="middle">Phase 4</text>
  <text class="desc" x="950" y="300" text-anchor="middle">説明テキスト</text>
</svg>
```

### 5. 比較チャート（2カラム対照）

```svg
<svg viewBox="0 0 1100 500" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .header { fill: #F5A623; rx: 12; }
    .col { fill: #ffffff; stroke: #e0e0e0; stroke-width: 2; rx: 12; }
    .vs { font-size: 28px; font-weight: 900; fill: #F5A623; }
  </style>

  <!-- 左カラム -->
  <rect class="header" x="50" y="30" width="450" height="60" />
  <text x="275" y="68" text-anchor="middle" fill="#ffffff" font-size="22" font-weight="700">Before</text>

  <rect class="col" x="50" y="110" width="450" height="350" />
  <text x="275" y="180" text-anchor="middle" font-size="18">特徴1</text>
  <text x="275" y="240" text-anchor="middle" font-size="18">特徴2</text>
  <text x="275" y="300" text-anchor="middle" font-size="18">特徴3</text>

  <!-- VS -->
  <text class="vs" x="550" y="270" text-anchor="middle">VS</text>

  <!-- 右カラム -->
  <rect class="header" x="600" y="30" width="450" height="60" />
  <text x="825" y="68" text-anchor="middle" fill="#ffffff" font-size="22" font-weight="700">After</text>

  <rect class="col" x="600" y="110" width="450" height="350" />
  <text x="825" y="180" text-anchor="middle" font-size="18">特徴1</text>
  <text x="825" y="240" text-anchor="middle" font-size="18">特徴2</text>
  <text x="825" y="300" text-anchor="middle" font-size="18">特徴3</text>
</svg>
```

## 品質ルール

- **角丸:** `rx="12"`（テーマの `border-radius: 12px` と統一）
- **線幅:** 2-3px（`stroke-width: 2` or `3`）
- **ドロップシャドウ・複雑フィルター禁止:** `filter` は使わない
- **SVGは自己完結:** 外部画像参照なし（フォント除く）
- **テキストは最小限:** 1ボックスに1-2行、図全体で10-15要素が上限
- **アクセシビリティ:** `<title>` 要素で図の説明を入れる
- **viewBox固定:** `width` / `height` 属性は指定しない（Marpのレスポンシブに任せる）
