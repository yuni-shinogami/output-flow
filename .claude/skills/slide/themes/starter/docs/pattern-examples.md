---
marp: true
theme: starter-theme
paginate: false
size: 16:9
---

<!--
  パターンサンプル集
  全13パターンを1スライドずつ収録した「生きたリファレンス」
  描画確認: ./.claude/skills/slide/scripts/build.sh .claude/skills/slide/themes/starter/docs/pattern-examples.md output/
-->

<script src="../../../js/tailwindcss.js"></script>
<script>
tailwind.config = {
  corePlugins: { preflight: false },
  theme: {
    extend: {
      colors: {
        'brand-orange': '#F5A623',
        'brand-orange-dark': '#F09819',
        'brand-orange-light': '#F7CE68',

        'brand-black': '#333333',
        'brand-gray': '#e0e0e0',
      },
      fontSize: {
        'slide-xs': '0.75em',
        'slide-sm': '0.875em',
        'slide-base': '1em',
        'slide-lg': '1.25em',
        'slide-xl': '1.5em',
        'slide-2xl': '2em',
        'slide-3xl': '2.5em',
        'slide-4xl': '3em',
      },
    },
  },
}
</script>

<!-- _class: cover -->

# パターンサンプル集

## 全13レイアウトパターン

---

<!-- Pattern 1: cover -->
<!-- _class: cover -->

# cover パターン

## グラデーション中央テキスト

---

<!-- Pattern 2: title -->
<!-- _class: title -->
<!-- _header: "サンプルイベント 2026" -->
<!-- _footer: "📷 スライド撮影OK　　🔄 SNSアップOK　　#sample" -->

# title パターン

サンプル登壇者

---

<!-- Pattern 3: self-intro -->
<!-- _class: self-intro -->

<div class="profile-left">
  <div style="width:220px;height:220px;border-radius:50%;border:4px solid white;background:#e0e0e0;display:flex;align-items:center;justify-content:center;font-size:0.8em;color:#333333;">avatar</div>
  <div class="profile-name">サンプル太郎</div>
  <div class="profile-name-en">Sample Taro</div>
</div>
<div class="profile-right">
  <h2>自己紹介</h2>
  <h3>サンプル太郎</h3>
  <h4>所属:</h4>
  <p>サンプル株式会社　エンジニア</p>
  <h4>趣味:</h4>
  <p>技術コミュニティ運営</p>
  <h4>X(Twitter):</h4>
  <p>@sample_taro</p>
</div>

---

<!-- Pattern 4: section-box -->
<!-- _class: section-box -->

# section-box パターン

グラデーション + 白枠ボックス

---

<!-- Pattern 5: section-line -->
<!-- _class: section-line -->

# section-line パターン

---

<!-- Pattern 6: bridge -->
<!-- _class: bridge -->

# ここから本題

---

<!-- Pattern 7: content -->
<!-- _class: content -->
<!-- _header: "セクション名" -->

## content パターン

- オレンジマーカーの箇条書き
- 1スライド1メッセージが原則
- 3〜5項目以内を推奨
- テキスト量は最小限に

---

<!-- Pattern 8: content-tree -->
<!-- _class: content-tree -->
<!-- _header: "セクション名" -->

## content-tree パターン

- 親項目（太字+マーカー）
  - 子項目A（通常weight+グレー縦線）
  - 子項目B
- 別の親項目
  - 子項目C
  - 子項目D

---

<!-- Pattern 9: emphasis -->
<!-- _class: emphasis -->
<!-- _header: "セクション名" -->

# 大きく太い1メッセージ

---

<!-- Pattern 10: emphasis-detail -->
<!-- _class: emphasis-detail -->
<!-- _header: "セクション名" -->

# emphasis-detail パターン

- 主張の根拠をリストで示す
- 具体例やデータを添える
- 3項目程度が適切

> まとめの一文をblockquoteで

---

<!-- Pattern 11: conclusion-bullets -->
<!-- _class: conclusion-bullets -->
<!-- _header: "セクション名" -->

- 根拠となるポイント1
- 根拠となるポイント2
- 根拠となるポイント3

# だから結論はこうなる

---

<!-- Pattern 12: result -->
<!-- _class: result -->

## 結果

<hr>

# result パターンの結果表示

---

<!-- Pattern 13: summary -->
<!-- _class: summary -->

# summary パターン

## まとめ

1. ポイント1をまとめる
2. ポイント2をまとめる
3. ポイント3をまとめる

---

<!-- TailwindCSS ユーティリティ活用例 -->
<!-- _class: content -->
<!-- _header: "TailwindCSS 活用例" -->

## TailwindCSSとの併用

<div class="grid grid-cols-2 gap-8 mt-8">
<div class="bg-brand-orange/10 rounded-xl p-6 border-2 border-brand-orange">
  <p class="text-slide-lg font-bold text-brand-orange">左カラム</p>
  <p class="text-slide-sm">TailwindCSSのgridで2カラム</p>
</div>
<div class="bg-brand-orange/10 rounded-xl p-6 border-2 border-brand-orange">
  <p class="text-slide-lg font-bold text-brand-orange">右カラム</p>
  <p class="text-slide-sm">ユーティリティクラスで装飾</p>
</div>
</div>

---

<!-- ============================================ -->
<!-- 画像レイアウト例: セクション区切り             -->
<!-- ============================================ -->
<!-- _class: section-box -->

# 画像レイアウト例

SVG / 画像ユーティリティクラス

---

<!-- 画像レイアウト例1: img-text-right + SVGフロー図 -->
<!-- _class: content -->
<!-- _header: "Re:Viewを使おう" -->

## 技術同人誌の制作フロー

<div class="img-text-right">
<div>

- 原稿はMarkdown感覚で執筆
- Re:Viewで紙面レイアウトに変換
- PDF出力して入稿
- 紙の書籍・電子書籍の両方に対応

</div>
<svg viewBox="0 0 500 400" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
    .box-accent { fill: #F5A623; rx: 12; }
    .box-white { fill: #ffffff; stroke: #F5A623; stroke-width: 2; rx: 12; }
  </style>
  <defs>
    <marker id="ar1" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#F09819" />
    </marker>
  </defs>
  <rect class="box-accent" x="150" y="20" width="200" height="60" />
  <text x="250" y="58" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">原稿執筆</text>
  <line x1="250" y1="80" x2="250" y2="110" stroke="#F09819" stroke-width="3" marker-end="url(#ar1)" />
  <rect class="box-white" x="150" y="115" width="200" height="60" />
  <text x="250" y="153" text-anchor="middle" font-size="18" font-weight="700">Re:View変換</text>
  <line x1="250" y1="175" x2="250" y2="205" stroke="#F09819" stroke-width="3" marker-end="url(#ar1)" />
  <rect class="box-white" x="150" y="210" width="200" height="60" />
  <text x="250" y="248" text-anchor="middle" font-size="18" font-weight="700">PDF出力</text>
  <line x1="250" y1="270" x2="250" y2="300" stroke="#F09819" stroke-width="3" marker-end="url(#ar1)" />
  <rect class="box-accent" x="150" y="305" width="200" height="60" />
  <text x="250" y="343" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">印刷所入稿</text>
</svg>
</div>

---

<!-- 画像レイアウト例2: img-full + 全幅アーキテクチャ図 -->
<!-- _class: content -->
<!-- _header: "LT作成ワークフロー" -->

## スライド作成の流れ

<div class="img-full">
<svg viewBox="0 0 1100 400" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
  </style>
  <defs>
    <marker id="ar2" markerWidth="10" markerHeight="7" refX="10" refY="3.5" orient="auto">
      <polygon points="0 0, 10 3.5, 0 7" fill="#F09819" />
    </marker>
  </defs>
  <!-- Phase 1 -->
  <rect x="20" y="120" width="180" height="100" rx="12" fill="#F5A623" />
  <text x="110" y="165" text-anchor="middle" fill="#ffffff" font-size="16" font-weight="700">アウトライン</text>
  <text x="110" y="195" text-anchor="middle" fill="#ffffff" font-size="13">構成・素材整理</text>
  <line x1="200" y1="170" x2="240" y2="170" stroke="#F09819" stroke-width="3" marker-end="url(#ar2)" />
  <!-- Phase 2 -->
  <rect x="250" y="120" width="180" height="100" rx="12" fill="#ffffff" stroke="#F5A623" stroke-width="2" />
  <text x="340" y="165" text-anchor="middle" font-size="16" font-weight="700">設計</text>
  <text x="340" y="195" text-anchor="middle" font-size="13" fill="#333333">枚数・パターン選定</text>
  <line x1="430" y1="170" x2="470" y2="170" stroke="#F09819" stroke-width="3" marker-end="url(#ar2)" />
  <!-- Phase 3 -->
  <rect x="480" y="120" width="180" height="100" rx="12" fill="#ffffff" stroke="#F5A623" stroke-width="2" />
  <text x="570" y="165" text-anchor="middle" font-size="16" font-weight="700">執筆</text>
  <text x="570" y="195" text-anchor="middle" font-size="13" fill="#333333">Marp形式で作成</text>
  <line x1="660" y1="170" x2="700" y2="170" stroke="#F09819" stroke-width="3" marker-end="url(#ar2)" />
  <!-- Phase 4 (optional) -->
  <rect x="710" y="120" width="180" height="100" rx="12" fill="#F7CE68" stroke="#F5A623" stroke-width="2" />
  <text x="800" y="160" text-anchor="middle" font-size="16" font-weight="700">ビジュアル</text>
  <text x="800" y="185" text-anchor="middle" font-size="13">SVG図解追加</text>
  <text x="800" y="208" text-anchor="middle" font-size="11" fill="#333333">(オプション)</text>
  <line x1="890" y1="170" x2="930" y2="170" stroke="#F09819" stroke-width="3" marker-end="url(#ar2)" />
  <!-- Phase 5 -->
  <rect x="940" y="120" width="140" height="100" rx="12" fill="#F5A623" />
  <text x="1010" y="165" text-anchor="middle" fill="#ffffff" font-size="16" font-weight="700">レビュー</text>
  <text x="1010" y="195" text-anchor="middle" fill="#ffffff" font-size="13">5観点で推敲</text>
  <!-- 繰り返し矢印 -->
  <path d="M 1010 220 L 1010 280 L 570 280 L 570 230" fill="none" stroke="#e0e0e0" stroke-width="2" stroke-dasharray="8,4" marker-end="url(#ar2)" />
  <text x="790" y="300" text-anchor="middle" font-size="12" fill="#333333">必要に応じて繰り返し</text>
</svg>
</div>

---

<!-- 画像レイアウト例3: img-text-left + 概念マップ -->
<!-- _class: content -->
<!-- _header: "サービス概要" -->

## システム構成要素

<div class="img-text-left">
<svg viewBox="0 0 500 400" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
  </style>
  <!-- 接続線 -->
  <line x1="250" y1="200" x2="100" y2="70" stroke="#F7CE68" stroke-width="2" />
  <line x1="250" y1="200" x2="400" y2="70" stroke="#F7CE68" stroke-width="2" />
  <line x1="250" y1="200" x2="100" y2="330" stroke="#F7CE68" stroke-width="2" />
  <line x1="250" y1="200" x2="400" y2="330" stroke="#F7CE68" stroke-width="2" />
  <!-- 中心 -->
  <rect x="175" y="170" width="150" height="60" rx="12" fill="#F5A623" />
  <text x="250" y="208" text-anchor="middle" fill="#ffffff" font-size="16" font-weight="700">コアシステム</text>
  <!-- ノード -->
  <rect x="25" y="40" width="150" height="55" rx="12" fill="#fff" stroke="#F5A623" stroke-width="2" />
  <text x="100" y="75" text-anchor="middle" font-size="15" font-weight="700">フロントエンド</text>
  <rect x="325" y="40" width="150" height="55" rx="12" fill="#fff" stroke="#F5A623" stroke-width="2" />
  <text x="400" y="75" text-anchor="middle" font-size="15" font-weight="700">API</text>
  <rect x="25" y="300" width="150" height="55" rx="12" fill="#fff" stroke="#F5A623" stroke-width="2" />
  <text x="100" y="335" text-anchor="middle" font-size="15" font-weight="700">データベース</text>
  <rect x="325" y="300" width="150" height="55" rx="12" fill="#fff" stroke="#F5A623" stroke-width="2" />
  <text x="400" y="335" text-anchor="middle" font-size="15" font-weight="700">インフラ</text>
</svg>
<div>

- フロントエンドはReact/Next.jsで構築
- APIはRESTとGraphQLを併用
- データベースはPostgreSQLを採用
- インフラはAWS上にデプロイ

</div>
</div>

---

<!-- 画像レイアウト例4: img-center + タイムライン -->
<!-- _class: content -->
<!-- _header: "プロジェクト経緯" -->

## プロジェクトの歩み

<div class="img-center">
<svg viewBox="0 0 900 280" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
  </style>
  <!-- タイムライン本線 -->
  <line x1="80" y1="140" x2="820" y2="140" stroke="#e0e0e0" stroke-width="4" />
  <!-- マイルストーン1 -->
  <circle cx="160" cy="140" r="18" fill="#F5A623" />
  <text x="160" y="147" text-anchor="middle" fill="#fff" font-size="13" font-weight="700">1</text>
  <text x="160" y="100" text-anchor="middle" font-size="14" font-weight="700">Q1</text>
  <text x="160" y="190" text-anchor="middle" font-size="13">企画・設計</text>
  <!-- マイルストーン2 -->
  <circle cx="360" cy="140" r="18" fill="#F5A623" />
  <text x="360" y="147" text-anchor="middle" fill="#fff" font-size="13" font-weight="700">2</text>
  <text x="360" y="100" text-anchor="middle" font-size="14" font-weight="700">Q2</text>
  <text x="360" y="190" text-anchor="middle" font-size="13">MVP開発</text>
  <!-- マイルストーン3 -->
  <circle cx="560" cy="140" r="18" fill="#F5A623" />
  <text x="560" y="147" text-anchor="middle" fill="#fff" font-size="13" font-weight="700">3</text>
  <text x="560" y="100" text-anchor="middle" font-size="14" font-weight="700">Q3</text>
  <text x="560" y="190" text-anchor="middle" font-size="13">ベータ公開</text>
  <!-- マイルストーン4 -->
  <circle cx="740" cy="140" r="18" fill="#F09819" />
  <text x="740" y="147" text-anchor="middle" fill="#fff" font-size="13" font-weight="700">4</text>
  <text x="740" y="100" text-anchor="middle" font-size="14" font-weight="700">Q4</text>
  <text x="740" y="190" text-anchor="middle" font-size="13">正式リリース</text>
  <!-- 補足テキスト -->
  <text x="450" y="250" text-anchor="middle" font-size="12" fill="#333333">1年間のプロジェクトロードマップ</text>
</svg>
<div class="caption">図: プロジェクトのタイムライン</div>
</div>

---

<!-- 画像レイアウト例5: content + アバター+吹き出し -->
<!-- アバター画像+吹き出しの配置例 -->
<!-- _class: content -->
<!-- _header: "今日のゴール" -->

## サンプルプレゼンのゴール

この発表で伝えたいメッセージを
ここに記載します

<div style="display: flex; justify-content: center; margin-top: 8px;">
<svg viewBox="0 0 320 170" xmlns="http://www.w3.org/2000/svg" style="max-height: 280px;">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; }
  </style>
  <!-- 吹き出し -->
  <rect x="30" y="5" width="250" height="45" rx="12" fill="#ffffff" stroke="#e0e0e0" stroke-width="2" />
  <text x="155" y="34" text-anchor="middle" font-size="14" fill="#333333">一緒に考えましょう</text>
  <polygon points="130,50 150,50 140,63" fill="#ffffff" stroke="#e0e0e0" stroke-width="2" />
  <polygon points="132,48 148,48 140,60" fill="#ffffff" />
  <!-- アバター（プレースホルダー） -->
  <circle cx="160" cy="118" r="48" fill="#F7CE68" />
  <text x="160" y="124" text-anchor="middle" font-size="14" fill="#ffffff" font-weight="700">avatar</text>
</svg>
</div>

---

<!-- 画像レイアウト例6: content + スクリーンショット風画像 -->
<!-- _class: content -->
<!-- _header: "ツール紹介" -->

## おすすめの開発ツール

- ブラウザベースのダッシュボードで管理
- チームコラボレーション機能が充実

<div class="img-center" style="margin-top: 0;">
<svg viewBox="0 0 800 120" xmlns="http://www.w3.org/2000/svg" style="max-height: 135px;">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; }
  </style>
  <!-- ブラウザ風フレーム -->
  <rect x="0" y="0" width="800" height="120" rx="8" fill="#f5f5f5" stroke="#e0e0e0" stroke-width="2" />
  <!-- タブバー -->
  <rect x="0" y="0" width="800" height="26" rx="8" fill="#e0e0e0" />
  <circle cx="18" cy="13" r="5" fill="#e0e0e0" />
  <circle cx="36" cy="13" r="5" fill="#e0e0e0" />
  <circle cx="54" cy="13" r="5" fill="#e0e0e0" />
  <rect x="80" y="4" width="200" height="18" rx="4" fill="#ffffff" />
  <text x="180" y="17" text-anchor="middle" font-size="9" fill="#333333">https://example.com/dashboard</text>
  <!-- コンテンツ領域 -->
  <rect x="20" y="34" width="250" height="76" rx="4" fill="#ffffff" stroke="#e0e0e0" stroke-width="1" />
  <rect x="30" y="42" width="230" height="40" rx="4" fill="#F7CE68" />
  <text x="145" y="68" text-anchor="middle" font-size="14" fill="#ffffff" font-weight="700">ダッシュボード</text>
  <rect x="30" y="88" width="100" height="16" rx="4" fill="#F5A623" />
  <text x="80" y="100" text-anchor="middle" font-size="9" fill="#ffffff">プロジェクト</text>
  <rect x="140" y="88" width="120" height="16" rx="4" fill="#ffffff" stroke="#F5A623" stroke-width="1" />
  <text x="200" y="100" text-anchor="middle" font-size="9" fill="#F5A623">メンバー</text>
  <!-- 右側コンテンツ -->
  <rect x="290" y="34" width="490" height="76" rx="4" fill="#ffffff" stroke="#e0e0e0" stroke-width="1" />
  <rect x="300" y="42" width="220" height="60" rx="4" fill="#f9f9f9" />
  <text x="410" y="78" text-anchor="middle" font-size="12" fill="#333333">グラフ表示エリア</text>
  <rect x="540" y="42" width="220" height="60" rx="4" fill="#f9f9f9" />
  <text x="650" y="78" text-anchor="middle" font-size="12" fill="#333333">統計表示エリア</text>
</svg>
</div>

---

<!-- 画像レイアウト例7: img-grid + 比較チャート -->
<!-- _class: content -->
<!-- _header: "LLM以前と以後" -->

## 開発フローの変化

<div class="img-grid">
<svg viewBox="0 0 450 350" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
  </style>
  <rect x="0" y="0" width="450" height="50" rx="12" fill="#e0e0e0" />
  <text x="225" y="33" text-anchor="middle" font-size="18" font-weight="700">Before</text>
  <rect x="0" y="60" width="450" height="280" rx="12" fill="#ffffff" stroke="#e0e0e0" stroke-width="2" />
  <text x="40" y="105" font-size="15">1. 公式ドキュメント読む</text>
  <text x="40" y="145" font-size="15">2. 設計書を作る</text>
  <text x="40" y="185" font-size="15">3. コーディング</text>
  <text x="40" y="225" font-size="15">4. PRレビュー</text>
  <text x="40" y="265" font-size="15">5. テスト</text>
  <text x="225" y="320" text-anchor="middle" font-size="13" fill="#333333">手作業中心の開発</text>
</svg>
<svg viewBox="0 0 450 350" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
  </style>
  <rect x="0" y="0" width="450" height="50" rx="12" fill="#F5A623" />
  <text x="225" y="33" text-anchor="middle" fill="#ffffff" font-size="18" font-weight="700">After</text>
  <rect x="0" y="60" width="450" height="280" rx="12" fill="#ffffff" stroke="#F5A623" stroke-width="2" />
  <text x="40" y="105" font-size="15">1. LLMと設計を壁打ち</text>
  <text x="40" y="145" font-size="15">2. AIアシストでコーディング</text>
  <text x="40" y="185" font-size="15">3. AIコードレビュー</text>
  <text x="40" y="225" font-size="15">4. テスト自動生成</text>
  <text x="40" y="265" font-size="15">5. 人間がレビュー・判断</text>
  <text x="225" y="320" text-anchor="middle" font-size="13" fill="#F09819">AI協業の開発</text>
</svg>
</div>

---

<!-- ============================================ -->
<!-- ベストプラクティス例: 余白と改行              -->
<!-- ============================================ -->
<!-- _class: section-box -->

# ベストプラクティス例

余白・改行・一行長

---

<!-- ベストプラクティス1: content（各項目が1行に収まる理想形） -->
<!-- 良い例: 各箇条書きが25〜35文字に収まり、十分な余白がある -->
<!-- _class: content -->
<!-- _header: "ベストプラクティス" -->

## 箇条書きの理想的な長さ

- 各項目は1行に収まる長さにする
- 25〜35文字が読みやすさの目安
- 長い場合は文言を短縮するか項目を分割
- 要素を端いっぱいまで配置しない

---

<!-- ベストプラクティス2: emphasis（2行h1の改行位置） -->
<!-- 良い例: 意味のまとまりで改行し、助詞の途中で切れない -->
<!-- _class: emphasis -->
<!-- _header: "ベストプラクティス" -->

# エンジニアの学びは<br>アウトプットで加速する

---

<!-- ============================================ -->
<!-- エッジケース例: 容量制限の境界テスト           -->
<!-- ============================================ -->
<!-- _class: section-box -->

# エッジケース例

容量制限の境界テスト

---

<!-- エッジケース1: emphasis-detail（h1が2行 + blockquote） -->
<!-- 容量の上限ケース: h1が2行折り返す場合、箇条書きは2項目まで -->
<!-- _class: emphasis-detail -->
<!-- _header: "エッジケース" -->

# 技術コミュニティ運営で学んだ、継続のコツ

- 完璧を求めず「まず始める」を最優先にする
- 仲間と共有することでモチベーションが持続する

> 継続は仕組み化が9割

---

<!-- エッジケース2: content + img-text-right（3項目版） -->
<!-- 容量の上限ケース: 画像付きでは箇条書き3項目が安全な上限 -->
<!-- _class: content -->
<!-- _header: "エッジケース" -->

## 画像付きコンテンツ（3項目版）

<div class="img-text-right">
<div>

- テキストと画像が共存するレイアウト
- 箇条書きは3項目が安全な上限
- 各項目は1行に収まる長さにする

</div>
<svg viewBox="0 0 400 300" xmlns="http://www.w3.org/2000/svg">
  <style>
    text { font-family: 'Noto Sans JP', sans-serif; fill: #333333; }
  </style>
  <rect x="0" y="0" width="400" height="300" rx="12" fill="#ffffff" stroke="#F5A623" stroke-width="2" />
  <rect x="20" y="20" width="360" height="80" rx="8" fill="#F5A623" />
  <text x="200" y="68" text-anchor="middle" fill="#ffffff" font-size="16" font-weight="700">図解エリア</text>
  <rect x="20" y="120" width="170" height="60" rx="8" fill="#F7CE68" />
  <text x="105" y="157" text-anchor="middle" font-size="14" font-weight="700">要素A</text>
  <rect x="210" y="120" width="170" height="60" rx="8" fill="#F7CE68" />
  <text x="295" y="157" text-anchor="middle" font-size="14" font-weight="700">要素B</text>
  <line x1="105" y1="180" x2="200" y2="230" stroke="#F09819" stroke-width="2" />
  <line x1="295" y1="180" x2="200" y2="230" stroke="#F09819" stroke-width="2" />
  <rect x="140" y="210" width="120" height="50" rx="8" fill="#F5A623" />
  <text x="200" y="242" text-anchor="middle" fill="#ffffff" font-size="14" font-weight="700">結果</text>
</svg>
</div>
