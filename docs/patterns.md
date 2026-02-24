# レイアウトパターンカタログ

> 9プレゼンテーション（400枚超）のビジュアル分析で全パターンの実使用を確認済み。
> 分析詳細: `work/slide-template/slide-analysis.md`

## パターン一覧

| # | クラス名 | 用途 | 背景 |
|---|----------|------|------|
| 1 | `cover` | カバー / エンディング | グラデーション |
| 2 | `title` | タイトル（イベント名+タイトル+登壇者） | 白+グリッド |
| 3 | `self-intro` | 自己紹介（左右2カラム） | オレンジ+白 |
| 4 | `section-box` | セクション区切り（白枠ボックス） | グラデーション |
| 5 | `section-line` | セクション区切り（アンダーライン） | グラデーション |
| 6 | `bridge` | ブリッジ（全画面1メッセージ） | グラデーション |
| 7 | `content` | コンテンツ（箇条書き） | 白 |
| 8 | `content-tree` | コンテンツ（ツリー構造） | 白 |
| 9 | `emphasis` | 強調（大太文字のみ） | 白 |
| 10 | `emphasis-detail` | 強調+箇条書き+まとめ | 白 |
| 11 | `conclusion-bullets` | 箇条書き→結論主張 | 白 |
| 12 | `result` | 結果発表（ラベル+白枠ボックス） | グラデーション |
| 13 | `summary` | まとめ（番号リスト） | グラデーション |

---

## 1. cover — カバースライド

**用途:** プレゼンの表紙・エンディング
**いつ使うか:** スライドの最初と最後

```markdown
<!-- _class: cover -->

# スライドタイトル
```

- グラデーション背景 + 白テキスト中央配置
- h1: 3em / 900 weight
- h2: 1.5em / 400 weight（サブタイトル用）
- ヘッダー・フッター非表示

**容量の目安:** h1は2行まで（1行あたり約14文字）。h2（サブタイトル）は使う場合1行。14文字を超える場合は `<br>` で改行位置を制御する。

---

## 2. title — タイトルスライド

**用途:** イベント名・タイトル・登壇者名を表示するメインタイトル
**いつ使うか:** 表紙の直後（イベント情報付き）

```markdown
<!-- _class: title -->
<!-- _header: "イベント名" -->
<!-- _footer: "📷 撮影OK　🔄 SNSアップOK　#ハッシュタグ" -->

# プレゼンタイトル

登壇者名
```

- グリッド背景（白+薄グレー線）
- ヘッダー: オレンジ帯+白文字イタリック
- h1: 4em / 900 weight / オレンジ+ストローク
- フッター: オレンジ帯+白文字中央

**容量の目安:** h1は2〜3行（1行あたり約9文字）。サブタイトル（p）は1行。9文字を超える場合は `<br>` で改行位置を制御する。

---

## 3. self-intro — 自己紹介スライド

**用途:** 登壇者の自己紹介
**いつ使うか:** 冒頭の自己紹介パート

```markdown
<!-- _class: self-intro -->

<div class="profile-left">
  <img src="avatar.png" alt="avatar" />
  <div class="profile-name">名前</div>
  <div class="profile-name-en">Name</div>
</div>
<div class="profile-right">
  <h2>自己紹介</h2>
  <h3>名前</h3>
  <h4>所属:</h4>
  <p>会社名　役職</p>
  <h4>趣味:</h4>
  <p>趣味内容</p>
</div>
```

- 左右2カラム（38:62）
- 左: オレンジ背景 + アバター画像（丸型）+ 名前
- 右: 白背景 + 詳細情報

**容量の目安:** 固定レイアウト。右側は h3×2 + h4×2 + p×2 程度。

---

## 4. section-box — セクション区切り（ボックス）

**用途:** 大きなセクションの開始を示す
**いつ使うか:** お品書きの各トピックに入る直前

```markdown
<!-- _class: section-box -->

# セクションタイトル

サブテキスト
```

- グラデーション背景 + 白枠ボックス内にタイトル
- h1: 2.8em / 900 weight / 白枠+角丸
- p: サブテキスト

**容量の目安:** h1は2行まで（1行あたり約13文字）。p（サブテキスト）は使う場合1行。13文字を超える場合は `<br>` で改行位置を制御する。

---

## 5. section-line — セクション区切り（ライン）

**用途:** 軽めのセクション区切り
**いつ使うか:** section-box より軽い区切りが欲しいとき

```markdown
<!-- _class: section-line -->

# セクションタイトル
```

- グラデーション背景 + アンダーライン
- h1: 2.8em / 900 weight / 下線

**容量の目安:** h1は2行まで（1行あたり約13文字）。13文字を超える場合は `<br>` で改行位置を制御する。

---

## 6. bridge — ブリッジスライド

**用途:** セクション転換、感情的インパクト、1メッセージの強調
**いつ使うか:** セクション間の転換点、クロージング直前、問いかけ

```markdown
<!-- _class: bridge -->

# ここから本題
```

- グラデーション背景 + 白太字中央配置
- h1: 2.8em / 900 weight
- 1-3行メッセージ（3行が上限）
- ヘッダー・フッター非表示

**実スライドでの使用例:**
- 「技術書同人誌って知ってますか？」（問いかけ型）
- 「学びの一歩が重い・・・！そんな時期が私にもありました」（共感型）
- 「慕狼ゆにって何やってる人？」（自己紹介への転換）
- 「エンジニアよ 楽しく盆栽を育てていこう」（クロージング）
- 「メタバースでの技術交流イベント 提案します！」（CTA型）
- **使用頻度:** プレゼンあたり3-8回（最も多用されるパターンの1つ）

**容量の目安:** h1は2行まで（1行あたり約13文字）。テキストのみ（箇条書きなし）。13文字を超える場合は `<br>` で改行位置を制御する。font-weight: 900 の太字は描画幅が広いため、12文字でも溢れることがある。

---

## 7. content — コンテンツスライド（箇条書き）

**用途:** メインコンテンツの説明
**いつ使うか:** 本題の各ポイントを箇条書きで説明するとき

```markdown
<!-- _class: content -->
<!-- _header: "セクション名" -->

## スライドタイトル

- ポイント1
- ポイント2
- ポイント3
```

- 白背景 + オレンジヘッダーバー
- h2: イタリック太字
- 箇条書き: オレンジ▶マーカー
- **推奨: 3〜5項目以内**（実スライドで確認済み）
- **最頻出パターン** — 全コンテンツスライドの約60-70%がこのパターン
- `_header` にセクション名を設定すると左上にオレンジボックスで表示される

**容量の目安:** h2は1行。箇条書きは4-5項目（各項目1行に収まる長さ）。画像レイアウトクラス（img-text-right等）と併用する場合は3項目が上限。

**テキスト配置の注意:**
- 箇条書きの各項目は1行に収まる長さにする（25〜35文字目安）
- 2行に渡る場合は文言を短縮するか、項目を分割する

---

## 8. content-tree — コンテンツスライド（ツリー構造）

**用途:** 階層的な情報を示す
**いつ使うか:** 親子関係や分類を見せたいとき

```markdown
<!-- _class: content-tree -->
<!-- _header: "セクション名" -->

## スライドタイトル

- 親項目1
  - 子項目A
  - 子項目B
- 親項目2
  - 子項目C
  - 子項目D
```

- 白背景 + オレンジヘッダーバー
- 親項目: 太字+▶マーカー
- 子項目: 通常weight+グレー縦線

**容量の目安:** h2は1行。親項目3つ×子項目2つ程度。ネストは2階層まで推奨。

---

## 9. emphasis — 強調スライド

**用途:** 1つのメッセージを大きく見せる
**いつ使うか:** 重要な主張、キーメッセージ

```markdown
<!-- _class: emphasis -->
<!-- _header: "セクション名" -->

# 強く伝えたいメッセージ
```

- 白背景 + オレンジヘッダーバー
- h1: 3.2em / 900 weight / 垂直中央配置
- テキストのみ（装飾なし）

**容量の目安:** h1は2行まで（1行あたり約11文字）。箇条書きなし（h1のみのパターン）。11文字を超える場合は `<br>` で改行位置を制御する。

---

## 10. emphasis-detail — 強調+詳細

**用途:** 主張+その根拠・詳細
**いつ使うか:** emphasis だけでは伝わらない補足が必要なとき

```markdown
<!-- _class: emphasis-detail -->
<!-- _header: "セクション名" -->

# 強く伝えたいメッセージ

- 根拠1
- 根拠2
- 根拠3

> まとめの一文
```

- 白背景 + オレンジヘッダーバー
- h1: 2.4em / 主張
- ul: 箇条書き根拠
- blockquote: まとめ（左ボーダー+イタリック、テキスト色は `#333333`）

**容量の目安:** h1が1行→箇条書き3項目 / h1が2行→箇条書き2項目（h1は1行あたり約15文字）。blockquoteを含む場合は箇条書きを1項目減らす。15文字を超える場合は `<br>` で改行位置を制御する。

---

## 11. conclusion-bullets — 結論スライド

**用途:** 箇条書きで根拠を示し、最後に結論
**いつ使うか:** セクションの締め、論理的な結論

```markdown
<!-- _class: conclusion-bullets -->
<!-- _header: "セクション名" -->

- 根拠1
- 根拠2
- 根拠3

# 結論メッセージ
```

- 白背景 + オレンジヘッダーバー
- ul: 上部に根拠
- h1: 下部に中央配置の結論（2.6em / 900 weight）

**容量の目安:** h1は1行。箇条書きは4項目まで。

---

## 12. result — 結果スライド

**用途:** 結果発表や重要な数値の提示
**いつ使うか:** データや成果を強調したいとき

```markdown
<!-- _class: result -->

## 結果

<hr>

# 主要な結果メッセージ
```

- グラデーション背景
- h2: ラベル（左寄せ・イタリック）
- hr: 白い区切り線
- h1: 白枠ボックス内に結果（2.8em / 900 weight）

**容量の目安:** h2は1行（ラベル）。h1は1行（結果メッセージ）。箇条書きなし。

---

## 13. summary — まとめスライド

**用途:** プレゼン全体のまとめ
**いつ使うか:** 締めパートのまとめ

```markdown
<!-- _class: summary -->

# タイトル

## サブタイトル

1. ポイント1
2. ポイント2
3. ポイント3
```

- グラデーション背景
- h1: 3em / イタリック太字
- h2: サブタイトル + 下線区切り
- ol: 白枠ボックス内に番号リスト

**容量の目安:** 番号リストは3-4項目。各項目は1行に収まる長さ（白枠内で約18文字が上限）。

---

## パターン選定ガイド

### スライドの役割から選ぶ

```
スライドの役割は？
├─ セクション区切り → bridge（強い転換）/ section-box（穏やかな区切り）/ section-line（軽い区切り）
├─ 1メッセージを強調 → emphasis（見出しのみ）/ emphasis-detail（見出し+根拠）
├─ 情報伝達 → content（箇条書き）/ content-tree（階層構造）/ content+img-*（図解付き）
├─ 結果・成果を発表 → result（インパクト重視）/ conclusion-bullets（まとめ的）
├─ 全体まとめ → summary
├─ 自己紹介 → self-intro
└─ 表紙・終了 → cover / title
```

### 背景で分類

**グラデーション背景**（インパクト重視）:
cover, title, section-box, section-line, bridge, result, summary

**白背景**（コンテンツ重視）:
content, content-tree, emphasis, emphasis-detail, conclusion-bullets

**特殊**:
self-intro（オレンジ+白の2カラム）

### 情報量で分類

**テキスト最小**（1メッセージ）:
cover, section-line, bridge, emphasis

**テキスト少**（タイトル+数項目）:
section-box, content, result, summary

**テキスト中**（タイトル+詳細+まとめ）:
content-tree, emphasis-detail, conclusion-bullets

**テキスト多**（複数セクション）:
self-intro, title

### プレゼンの流れでの推奨配置

```
cover → title → self-intro → [会社紹介(外部LTの場合)] → bridge("ここから本題")
→ content(お品書き) → bridge → content(転換お品書き)
→ content/content-tree/emphasis/emphasis-detail
→ bridge → content(転換お品書き) → ...
→ conclusion-bullets → summary → bridge(クロージング) → [おまけ/宣伝]
```

---

## ビジュアル分析からの追加知見

### 実スライドで確認されたパターンの使用頻度

| パターン | 使用頻度 | 備考 |
|---------|---------|------|
| content | 最多（60-70%） | セクションボックス+箇条書きが基本 |
| bridge | 非常に多い（3-8回/プレゼン） | テンポの緩急に不可欠 |
| title | 全プレゼンで1回 | 必須 |
| self-intro | 全プレゼンで1回 | 必須 |
| emphasis | 多い（各セクション1-2回） | 核メッセージに使用 |
| content-tree | 中程度 | 階層情報がある場合 |
| summary | 全プレゼンで1回 | 締めに必須 |
| section-box/section-line | 少なめ | bridgeで代替されることが多い |
| cover | 1回 | 表紙 |

### キャラクターイラストの使い方

キャラクター（VRChatアバター）を使う場合は、HTML `<img>` で配置する。

```markdown
<!-- _class: content -->
<!-- _header: "お品書き" -->

## テーマ

<div style="display: flex; align-items: center; gap: 40px;">
<div>

- トピック1
- トピック2
- トピック3

</div>
<img src="avatar.png" style="height: 300px;" />
</div>
```

- お品書きスライドとの相性が良い
- 吹き出しとセットで親近感を演出
- 全スライドに使う必要はない（お品書き、Q&A、掴みに限定）

### QRコード配置パターン

```markdown
<!-- _class: content -->
<!-- _header: "質疑応答" -->

<div style="display: flex; gap: 40px; justify-content: center;">
<div style="text-align: center; border: 4px solid #F5A623; border-radius: 12px; padding: 20px;">
  <img src="qr1.png" style="width: 200px;" />
  <p>ラベル1</p>
</div>
<div style="text-align: center; border: 4px solid #F5A623; border-radius: 12px; padding: 20px;">
  <img src="qr2.png" style="width: 200px;" />
  <p>ラベル2</p>
</div>
</div>
```

- オレンジボーダー + 角丸の枠で統一
- 2-3個のQRコードをflexで横並び配置

### 画像レイアウトクラス

既存パターン（content, emphasis等）の中で、画像・SVGとテキストの配置に使うユーティリティクラス。

| クラス名 | 用途 |
|---------|------|
| `img-text-left` | 画像左 + テキスト右 |
| `img-text-right` | テキスト左 + 画像右 |
| `img-center` | 画像中央 + キャプション |
| `img-full` | 全幅ダイアグラム |
| `img-grid` | 画像グリッド（2-3枚） |

#### img-text-right（テキスト左 + 画像右）

```markdown
<!-- _class: content -->
<!-- _header: "セクション名" -->

## テーマ

<div class="img-text-right">
<div>

- ポイント1
- ポイント2
- ポイント3

</div>
<img src="images/diagram.svg" alt="説明" />
</div>
```

#### img-text-left（画像左 + テキスト右）

```markdown
<!-- _class: content -->
<!-- _header: "セクション名" -->

## テーマ

<div class="img-text-left">
<img src="images/diagram.svg" alt="説明" />
<div>

- ポイント1
- ポイント2
- ポイント3

</div>
</div>
```

#### img-center（画像中央 + キャプション）

```markdown
<!-- _class: content -->
<!-- _header: "セクション名" -->

## テーマ

<div class="img-center">
<img src="images/diagram.svg" alt="説明" />
<div class="caption">図: キャプションテキスト</div>
</div>
```

#### img-full（全幅ダイアグラム）

```markdown
<!-- _class: content -->
<!-- _header: "セクション名" -->

## テーマ

<div class="img-full">
<img src="images/flow-overview.svg" alt="全体フロー図" />
</div>
```

#### img-grid（画像グリッド）

```markdown
<!-- _class: content -->
<!-- _header: "セクション名" -->

## 比較

<div class="img-grid">
<img src="images/before.svg" alt="Before" />
<img src="images/after.svg" alt="After" />
</div>
```

**注意:**
- これらはトップレベルパターン（`_class:`）ではなく、既存パターン内で使うユーティリティクラス
- SVG/画像の生成・配置ルールの詳細は `docs/svg-guide.md` を参照
