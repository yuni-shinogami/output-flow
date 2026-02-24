---
name: write
description: アウトラインをもとに技術ブログ・記事・まとまった文章を執筆するワークフローを管理する。プロジェクト状態を自動判定し適切なフェーズから開始する。「執筆」「記事を書く」「ブログを書く」「write」で起動。
user-invocable: true
allowed-tools: Read, Bash, Skill
argument-hint: "<project-name>"
---

# 執筆ワークフロー・オーケストレーター

## フロー

```
Phase 1(prepare) → Phase 2(body) → Phase 3(review)
```

前提: outlineワークフローで `outline.md` が作成済みであること。

## 処理

### 1. プロジェクト名の確定

- `$ARGUMENTS` あり → そのまま使う
- `$ARGUMENTS` なし → `ls output/` で一覧表示し、既存から選択をユーザーに確認

### 2. 状態判定と自動起動

`output/<project>/` 内のファイル存在で次フェーズを判定し、Skillツールで起動する:

| outline/outline.md | write/write-plan.md | write/draft.md | 起動するスキル |
|:------------------:|:-------------------:|:--------------:|:--------------:|
| なし | - | - | outlineワークフローを案内（`/outline`） |
| あり | なし | - | `write-prepare` |
| あり | あり | なし | `write-body` |
| あり | あり | あり | `write-review` |

状態をユーザーに伝えてからスキルを起動する。
