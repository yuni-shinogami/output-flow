# コントリビューションガイド

output-flow への貢献に興味を持っていただきありがとうございます。

## 開発の始め方

```bash
git clone https://github.com/yuni-shinogami/output-flow.git
cd output-flow
```

Claude Code を起動して、スキルが動作することを確認してください。

## ブランチ戦略

GitHub Flow を採用しています。`main` ブランチは常に動作する状態を保ちます。

```
main（常に動く状態）
 ├── feat/slide-workflow
 ├── fix/outline-refine-log
 ├── exp/multi-language
 └── docs/contributing-guide
```

### ブランチ命名規則

| プレフィックス | 用途 | 例 |
|---|---|---|
| `feat/` | 新機能・新ワークフロー | `feat/slide-workflow` |
| `fix/` | バグ修正 | `fix/outline-refine-log` |
| `exp/` | 実験（マージするか未定） | `exp/ai-auto-review` |
| `docs/` | ドキュメント修正 | `docs/contributing-guide` |

### ブランチの運用ルール

- **`main` への直接コミットは避ける** — 必ずブランチを切って PR 経由でマージする
- **`exp/` は気軽に作って消してOK** — 実験が成功したら `feat/` に切り直すか、そのままPRにする

## Pull Request の出し方

1. ブランチを作成する

```bash
git checkout -b feat/your-feature
```

2. 変更をコミットする
3. Push して PR を作成する

```bash
git push -u origin feat/your-feature
```

### PR に含めてほしい情報

- 変更の目的（何を・なぜ）
- 動作確認の方法（該当スキルを実行して確認した等）

## スキルの追加・変更時の注意点

このプロジェクトはスキル間の参照が密結合です。変更時は以下を必ず確認してください。

### 1. パス参照の整合性

スキルが参照・出力するファイルパスは `output/$ARGUMENTS/outline/` または `output/$ARGUMENTS/write/` です。新しいワークフローを追加する場合は、対応するサブディレクトリ（例: `output/$ARGUMENTS/slide/`）を使ってください。

### 2. スキル間の呼び出し連鎖

各フェーズのスキルは完了時に次フェーズの Skill を自動起動します。

```
outline: context → goal → draft → refine
write:   prepare → body → review
```

連鎖を変更する場合は、前後のスキル両方を更新してください。

### 3. オーケストレーターの状態判定

`outline/SKILL.md` と `write/SKILL.md` はファイルの有無でフェーズを判定します。出力先のパスを変更した場合は、オーケストレーターの判定テーブルも必ず更新してください。

### 4. テンプレート

各スキルの `templates/` にあるテンプレートは、出力フォーマットの定義です。テンプレートを変更する場合は、サンプルプロジェクト（`output/sample-and-usage-guide/`）も合わせて更新してください。

## 新しいワークフローを追加するには

`/outline` → `/write` のように、新しい下流ワークフロー（例: スライド作成）を追加する場合の手順です。

1. `.claude/skills/` にスキルディレクトリを作成する（例: `slide/`, `slide-plan/`, `slide-draft/`, `slide-review/`）
2. オーケストレーター（例: `slide/SKILL.md`）と各フェーズのスキルを作成する
3. 成果物の出力先は `output/$ARGUMENTS/slide/` に統一する
4. README の全体像とファイル構成セクションを更新する

既存の `write` ワークフローの構造を参考にすると、スムーズに作れます。
