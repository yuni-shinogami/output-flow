---
name: outline
description: アウトプット（LT・技術記事・書籍）のアウトラインを作成するワークフローを管理する。プロジェクト状態を自動判定し適切なフェーズから開始する。「アウトライン」「骨格」「構成を作りたい」で起動。
user-invocable: true
allowed-tools: Read, Bash, Skill
argument-hint: "<project-name>"
---

# アウトラインワークフロー・オーケストレーター

## フロー

```
                    ┌─ A. ゴール先行: Phase 2(goal) → Phase 3(draft) ─┐
Phase 1(context) →─┤                                                   ├→ Phase 4(refine)
                    └─ B. 素材先行:   Phase 3(draft + goal発見) ───────┘
```

## 処理

### 1. プロジェクト名の確定

CLAUDE.mdの命名規則に従い `$ARGUMENTS` を解決する。

- `$ARGUMENTS` あり → CLAUDE.mdの解決アルゴリズムでディレクトリを特定
- `$ARGUMENTS` なし → `ls output/` で一覧表示し、既存から選択 or 新規作成をユーザーに確認

**重要: 解決後のフルディレクトリ名（例: `20260301-01_吉祥寺.pm39登壇`）を子スキルに `$ARGUMENTS` として渡すこと。**

### 2. 状態判定と自動起動

`output/<project>/outline/` 内のファイル存在で次フェーズを判定し、Skillツールで起動する：

| context.md | goal.md | outline.md | 起動するスキル |
|:----------:|:-------:|:----------:|:--------------:|
| なし | - | - | `outline-context` |
| あり | なし | なし | **ユーザーに進め方を確認**（下記参照） |
| あり | あり | なし | `outline-draft` |
| あり | あり | あり | `outline-refine` |

状態をユーザーに伝えてからスキルを起動する。

#### 進め方の確認（context.md あり・goal.md なし・outline.md なし）

ユーザーに以下の2つの進め方を提示し、選んでもらう：

- **A. ゴールを先に決める**（従来フロー）: 受け手に期待する変化やメッセージを先に固めてから構成を作る。伝えたいことが明確なときに向いている。
  → `outline-goal` を起動
- **B. 素材から先に考える**（素材先行フロー）: 話したい素材やエピソードを先に出して、整理しながらゴールを見つける。まだ何を言いたいか固まっていないときに向いている。
  → `outline-draft` を引数 `$ARGUMENTS` で起動（goal.md なしで起動すると素材先行モードになる）
