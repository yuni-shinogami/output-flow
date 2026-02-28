---
name: slide-theme
description: 既存スライドの分析やブランドカラー指定からMarpテーマCSSとデザインシステムドキュメント（patterns.md, style-guide.md, svg-guide.md）を生成する。テーマの新規作成・カスタマイズに使用。「テーマ作成」「テーマ」「theme」で起動。
user-invocable: true
allowed-tools: Read, Write, Edit, Bash, Glob, Grep
argument-hint: "<theme-name>"
---

# テーマ作成ワークフロー

既存スライドの分析またはブランドカラー指定から、Marpテーマ（CSS）+ デザインシステムdocs をセットで生成する。

生成先: `.claude/skills/slide/themes/<theme-name>/`

## ステップ1: テーマ名の確定

- `$ARGUMENTS` あり → そのまま使う
- `$ARGUMENTS` なし → ユーザーに聞く（kebab-case、例: `my-company`, `tech-talk`）

既存テーマ確認: `ls .claude/skills/slide/themes/` で一覧表示。同名テーマがあれば上書き確認。

## ステップ2: 作成パスの選択

ユーザーに3つのパスを提示し、選んでもらう:

| パス | 説明 | 入力 |
|:-----|:-----|:-----|
| **A. カラーカスタマイズ** | starterのレイアウトを維持し色・フォントを変更 | ブランドカラー |
| **B. スライド分析から作成** | 既存スライドを分析してテーマ+docsを生成 | スライド素材（PDF/画像/Marp） |
| **C. CSSインポート** | 既存Marp CSSからdocsを自動生成 | CSSファイル |

---

## パスA: カラーカスタマイズ

### A-1. ブランド情報のヒアリング

以下を聞く:

- **メインカラー**（必須）: ブランドの主要色（例: `#1E88E5`）
- **ダークカラー**（任意）: グラデーション始点。未指定ならメインカラーから自動生成
- **ライトカラー**（任意）: グラデーション終点。未指定ならメインカラーから自動生成
- **テキスト色**（任意）: デフォルト `#333333`
- **フォント**（任意）: デフォルト `"Noto Sans JP", sans-serif`

### A-2. テーマ生成

1. `themes/starter/` をコピーして `themes/<theme-name>/` を作成
2. CSSリネーム: `starter-theme.css` → `<theme-name>.css`
3. `@theme` 宣言を変更
4. `:root` カラー変数を置換
5. `tailwind.config.js` のカラー定義を更新

→ **ステップ3** へ

---

## パスB: スライド分析から作成

### B-1. 素材の収集

ユーザーに分析対象を聞く:

- **Marp (.md)**: そのまま読み取り可能
- **PDF**: `pdftoppm` や Marp CLI でPNG変換 → Vision分析
- **画像 (PNG/JPG)**: Visionで直接分析
- **枚数目安**: 最低20枚、理想50枚以上

### B-2. 分析の実行

詳細手順は [analysis-guide.md](analysis-guide.md) を参照。4つの観点で分析:

1. **カラーパレット** — メイン色、アクセント色、背景色、グラデーション
2. **レイアウトパターン** — 表紙、区切り、コンテンツ配置、強調表現
3. **タイポグラフィ** — フォント、見出し/本文サイズ、行間
4. **容量ルール** — パターン別の箇条書き数、見出し文字数上限、コード行数上限

分析結果をユーザーに提示し、方向性の確認を取る。

### B-3. パターン設計

分析結果をもとにレイアウトパターンを設計:

- starterの13パターンをベースに、ユーザーのスライドに合うものを選択
- 不要なパターンは除外、必要なパターンは追加
- 各パターンの容量制限を分析結果から設定

パターン一覧をユーザーに提示し確認。

### B-4. CSS生成

テンプレート [templates/theme.css](templates/theme.css) をベースにCSSを生成:

- `:root` にカラーパレットを設定
- 各パターンの `section.*` スタイルを実装
- 画像レイアウトユーティリティを含める

→ **ステップ3** へ

---

## パスC: CSSインポート

### C-1. CSSの読み込みと分析

ユーザーにMarp CSSのパスを聞き、読み込む。以下を自動抽出:

- `@theme` 名
- `:root` カラー変数
- `section.*` クラス一覧（= レイアウトパターン）
- フォント設定
- 各パターンの構造（flex/grid、見出しサイズ等）

### C-2. セットアップ

1. `themes/<theme-name>/` を作成
2. CSSを配置（`@theme` 名がテーマ名と異なればリネーム確認）
3. `docs/` ディレクトリを作成

→ **ステップ3** へ

---

## ステップ3: デザインシステムdocs生成

パスに関わらず、以下の3ファイルを生成する:

| ファイル | 内容 | テンプレート |
|:---------|:-----|:-------------|
| `docs/patterns.md` | `_class:` パターンカタログ + Marpコード例 + 容量制限 | [templates/patterns.md](templates/patterns.md) |
| `docs/style-guide.md` | カラーパレット + タイポグラフィ + NGパターン | [templates/style-guide.md](templates/style-guide.md) |
| `docs/svg-guide.md` | SVG生成時のカラー・サイズ制約 | [templates/svg-guide.md](templates/svg-guide.md) |

### docs生成のルール

- CSSの `:root` 変数と `section.*` クラスに**完全に整合**させる
- パターンごとにMarpコード例を含める（コピペで使える形式）
- 容量制限はCSS実装（padding, font-size, overflow）から算出
- パスBの場合: 分析で得た実測値も反映

生成後、docsの概要をユーザーに提示し確認を取る。

## ステップ4: 設定の更新

### 4-1. marp.config.mjs

```javascript
export default {
  themeSet: ['.claude/skills/slide/themes/<theme-name>/<theme-name>.css'],
  html: true,
}
```

### 4-2. スライドテンプレート

`slide-draft/templates/slides.md` を更新:

- `theme:` フロントマター
- TailwindCSS カラー定義
- CSSコメント内のパス

### 4-3. スキル内のdocs参照パス

以下のファイル内の `themes/starter/docs/` → `themes/<theme-name>/docs/` に更新:

- `slide-draft/SKILL.md`
- `slide-plan/SKILL.md`
- `slide-review/SKILL.md`、`review-prompts.md`
- `slide-style/SKILL.md`
- `slide-visual/SKILL.md`

**更新前にユーザーに確認を取る。**

## ステップ5: プレビュー検証

### 5-1. テストビルド

サンプルスライドまたは既存プロジェクトのスライドでビルド:

```bash
./.claude/skills/slide/scripts/build.sh <slides.md>
```

### 5-2. ビジュアル確認

スクリーンショットを生成し、主要パターンをVisionで確認:

```bash
./.claude/skills/slide/scripts/take-screenshots.sh <slides.md> <output-dir>
```

チェックポイント:
- テキストのはみ出し・切れ
- グラデーション上のテキスト可読性
- レイアウト崩れ
- カラーの統一感

### 5-3. フィードバックループ

問題があれば: CSS修正 → 再ビルド → 再確認を繰り返す。
docs に影響する修正があれば docs も更新する。

## 完了条件

- [ ] テーマCSS がビルド可能
- [ ] 全パターンが正しく表示される
- [ ] docs が CSS と整合している
- [ ] marp.config.mjs が更新されている
- [ ] スキルの docs 参照パスが更新されている
- [ ] ユーザーが確認済み
