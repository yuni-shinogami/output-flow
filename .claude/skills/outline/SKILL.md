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
Phase 1(context) → Phase 2(goal) → Phase 3(draft) → Phase 4(refine)
```

## 処理

### 1. プロジェクト名の確定

- `$ARGUMENTS` あり → そのまま使う
- `$ARGUMENTS` なし → `ls output/` で一覧表示し、既存から選択 or 新規作成をユーザーに確認

### 2. 状態判定と自動起動

`output/<project>/` 内のファイル存在で次フェーズを判定し、Skillツールで起動する：

| context.md | goal.md | outline.md | 起動するスキル |
|:----------:|:-------:|:----------:|:--------------:|
| なし | - | - | `outline-context` |
| あり | なし | - | `outline-goal` |
| あり | あり | なし | `outline-draft` |
| あり | あり | あり | `outline-refine` |

状態をユーザーに伝えてからスキルを起動する。
