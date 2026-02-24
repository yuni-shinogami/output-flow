# テーマガイド

output-flow のスライドスキルは、Marp テーマとデザインシステムドキュメントをセットにした「テーマパッケージ」でスライドのビジュアルを制御します。

## ディレクトリ構造

```
themes/
  starter/                  ← デフォルトテーマ（OSS同梱）
    starter-theme.css       ← Marp テーマ CSS
    tailwind.config.js      ← TailwindCSS カラー定義（参考）
    docs/
      patterns.md           ← レイアウトパターンカタログ
      style-guide.md        ← カラー・タイポグラフィ・NG集
      svg-guide.md          ← SVG 生成ガイド
      pattern-examples.md   ← パターン実装例（汎用サンプル）
  your-theme/               ← あなたのテーマ（新規作成）
    your-theme.css
    docs/
      patterns.md
      style-guide.md
      svg-guide.md
```

## starter テーマ

オレンジ系グラデーションをベースにした 13 パターンのレイアウトを持つデフォルトテーマです。そのまま使うことも、`/slide-theme` でカスタマイズのベースにすることもできます。

## 自分のテーマを作る

`/slide-theme <テーマ名>` スキルを使うと、以下の3つの方法でテーマを作成できます:

1. **カラーカスタマイズ** — starter をコピーし、カラーパレットを変更
2. **スライド分析から作成** — 既存スライド（PDF/画像）を分析してパターンを抽出
3. **CSSインポート** — 既存の Marp テーマ CSS を持ち込む

手動で作成する場合の手順は以下の通りです。

### 手動方法 1: starter をカスタマイズする

1. `starter/` をコピーして新しいディレクトリを作成:
   ```bash
   cp -r .claude/skills/slide/themes/starter .claude/skills/slide/themes/my-theme
   mv .claude/skills/slide/themes/my-theme/starter-theme.css .claude/skills/slide/themes/my-theme/my-theme.css
   ```

2. CSS の `@theme` 宣言を変更:
   ```css
   /* @theme my-theme */
   ```

3. `:root` のカラー変数を自分の配色に変更:
   ```css
   :root {
     --color-orange: #あなたのメインカラー;
     --color-orange-dark: #グラデーション始点;
     --color-orange-light: #グラデーション終点;
     --color-bg-gradient: linear-gradient(135deg, #始点 0%, #終点 100%);
     /* ... */
   }
   ```

4. `docs/style-guide.md` のカラーパレットを更新

5. `marp.config.mjs` のパスを更新:
   ```javascript
   export default {
     themeSet: ['.claude/skills/slide/themes/my-theme/my-theme.css'],
     html: true,
   }
   ```

6. スライド作成時のテンプレートで `theme: my-theme` を使用

### 手動方法 2: 既存の Marp テーマを持ち込む

1. テーマ CSS を `themes/your-theme/your-theme.css` に配置
2. `docs/` ディレクトリを作成し、テーマに合わせたドキュメントを記述:
   - `patterns.md` — テーマが提供するレイアウトパターン（`_class:` で使えるクラス名）
   - `style-guide.md` — カラーパレット、タイポグラフィ、NG パターン
   - `svg-guide.md` — SVG 生成時のカラー制約
3. `marp.config.mjs` を更新

## テーマ切替時に更新が必要なファイル

| ファイル | 更新内容 |
|:---------|:---------|
| `marp.config.mjs` | `themeSet` のパス |
| `slide-draft/templates/slides.md` | `theme:` フロントマター、TailwindCSS カラー定義 |
| `slide-plan/templates/slide-plan.md` | テーマ名の記載 |
| スキル内の docs 参照パス | テーマ固有の docs ディレクトリパス |

## デザインシステムドキュメントの役割

| ファイル | 役割 | スキルでの使われ方 |
|:---------|:-----|:-------------------|
| `patterns.md` | `_class:` で使えるパターン一覧と容量制限 | slide-plan（パターン選定）、slide-draft（執筆）、slide-review（準拠チェック） |
| `style-guide.md` | カラー・フォント・余白・NG ルール | slide-draft（スタイル遵守）、slide-review（準拠チェック） |
| `svg-guide.md` | SVG 内で使える色とサイズの制約 | slide-visual（SVG 生成）、slide-draft（インライン SVG） |

これらのドキュメントがテーマの CSS と整合していることが重要です。CSS を変更したら、対応するドキュメントも更新してください。
