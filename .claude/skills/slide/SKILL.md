---
name: slide
description: アウトラインをもとにLTスライドを作成するワークフローを管理する。プロジェクト状態を自動判定し適切なフェーズから開始する。「スライド」「slide」「デッキ」で起動。
user-invocable: true
allowed-tools: Read, Bash, Skill
argument-hint: "<project-name>"
---

# スライドワークフロー・オーケストレーター

## フロー

```
Phase 1(plan) → Phase 2(draft) → Phase 2.3(visual, optional) → Phase 2.5(style) → Phase 3(review)
```

前提: outlineワークフローで `outline.md` が作成済みであること。

## 処理

### 1. プロジェクト名の確定

- `$ARGUMENTS` あり → そのまま使う
- `$ARGUMENTS` なし → `ls output/` で一覧表示し、既存から選択をユーザーに確認

### 2. 状態判定と自動起動

`output/<project>/` 内のファイル存在で次フェーズを判定し、Skillツールで起動する:

| outline/outline.md | slide/slide-plan.md | slide/slides.md | `_class:` あり | 起動するスキル |
|:------------------:|:-------------------:|:---------------:|:--------------:|:--------------:|
| なし | - | - | - | outlineワークフローを案内（`/outline`） |
| あり | なし | - | - | `slide-plan` |
| あり | あり | なし | - | `slide-draft` |
| あり | あり | あり | なし | `slide-style`（デザインシステム適用を案内） |
| あり | あり | あり | あり | `slide-review` |

`slides.md` が存在するが `<!-- _class:` が1つも含まれていない場合、デザインシステムが未適用と判断し `/slide-style` を案内する。ユーザーがスキップを選んだ場合は `slide-review` を起動する。

状態をユーザーに伝えてからスキルを起動する。

### オプション: ビジュアル強化

`slides.md` 作成直後（Phase 2 完了時）にユーザーに「SVG図解によるビジュアル強化を行うか？」と確認する。
希望する場合は `slide-visual` を引数 `$ARGUMENTS` で起動し、スキップする場合は次フェーズ（style or review）へ進む。
