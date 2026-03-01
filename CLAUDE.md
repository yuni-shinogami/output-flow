# output-flow プロジェクト規約

## output/ ディレクトリの命名規則

### フォーマット

```
YYYYMMDD-NN_タイトル
```

- **YYYYMMDD**: プロジェクト作成日（例: 20260301）
- **NN**: 同日連番（01から開始、例: 01, 02, 03）
- **タイトル**: ユーザーが指定したプロジェクト名

例: `20260301-01_吉祥寺.pm39登壇`

### プロジェクト名の解決アルゴリズム

ユーザーが `$ARGUMENTS` でタイトルを指定した場合、以下の順序で `output/` 内のディレクトリを解決する:

1. **完全一致**: `output/$ARGUMENTS` が存在する → そのまま使用
2. **パターン一致**: `output/*_$ARGUMENTS` にマッチするディレクトリを検索
   - 1件一致 → そのディレクトリを使用
   - 複数一致 → ユーザーに選択を求める
3. **一致なし** → 新規プロジェクト扱い
   - 新規ディレクトリ名を `YYYYMMDD-NN_タイトル` で自動生成する
   - YYYYMMDD は当日の日付
   - NN は同日の既存プロジェクト数 + 1（ゼロ埋め2桁）

### 解決の実装例（bash）

```bash
# パターン一致の検索
matches=(output/*_"${ARGUMENTS}")
if [ ${#matches[@]} -eq 1 ] && [ -d "${matches[0]}" ]; then
  PROJECT_DIR="${matches[0]}"
fi
```

### 新規プロジェクト作成時の連番決定

```bash
TODAY=$(date +%Y%m%d)
EXISTING=$(ls -d output/${TODAY}-* 2>/dev/null | wc -l)
NN=$(printf "%02d" $((EXISTING + 1)))
NEW_DIR="output/${TODAY}-${NN}_${TITLE}"
```

### ソート順

- **スキル内の一覧表示（`/idea list` 等）**: デフォルトは**降順（新しい順）**で表示する
- **ターミナル**: `ls -r output/` で降順表示できる
