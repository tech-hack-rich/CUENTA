# アプリ名
CUENTA　　　　　スペイン語で（数える、口座）などの意味があります
# 概要
CUENTAは
一人のユーザーは複数の口座を登録でき、口座には資産額の記録と投資額の記録が作成でき、それらの直近の記録に基づいて、現在の利益と利益率が見れる。

口座は、「FXの口座」「株の口座」「仮想通貨の口座」など、種類別に登録し、それぞれの詳細ページで投資額と資産額の記録が日付と一緒に保存できるようになっている。保存した最新の記録に基づいて、利益と利益率が詳細ページのトップ部分で見ることができる。
# 本番環境
発表終了後実装予定
# 制作背景(意図)
私は投資初心者で、初心者のような私でも見やすい資産管理アプリを探していましたが、なかなか思うような、シンプルで見やすい物がなく、ずっとあればいいなと思っていました。そこで今回は初心者にやしいアプリケーションを作ろうと思いました。従来のアプリケーションは、今回の「口座機能」のように、種類別で記録が一覧表示されている物がなく、正直初心には見づらい表示になっていたので、今回は以下の二点にフォーカスして作成しました。
- 「口座」のように投資の種類や銘柄ごとに資産の記録が残せて、それぞれの利益が見やすいシンプルな表示
- 私のような投資初心者でも見やすくするために、最低限の情報のみを表示

# DEMO

トップページ（口座一覧表示画面）ログインしている場合、ログインユーザーの口座を表示
![3f79a8de0f4d84b8fb6a7aee4cfde616](https://user-images.githubusercontent.com/77149493/109939682-a66e5a80-7d14-11eb-8ee6-dc06e572fcd8.jpg)

# 工夫したポイント
- 投資の種類や銘柄ごとに口座が作成できて、トップページにその一覧を表示することで、編集したい口座を選びやすいようにしました。
- 気軽に使得るようにするために、新規登録に必要とする情報は最低限にしました。
- なるべく全ての動作が一つのページで完結するために、資産額と投資額の作成と削除は口座の詳細ページで、できるようにしました。

# 使用技術（開発環境）
## バックエンド
Ruby, Ruby on Rails

## フロントエンド
HTML,CSS

## データベース
mysql2

## インフラ
Docker (開発環境)

## WEBサーバー（本番環境）
Heroku 

## ソース管理
GitHub, GitHubDesktop

## テスト
Rspec

## エディタ
VsCode

# 課題と今後実装したい機能
## 課題
- スマホ、タブレットに表示する際、メインコンテンツとフッターが噛み合わないので、レスポンシブデザインの調整
- CSS,HTMLのために設定したクラス名がわかりにくい箇所があるため、フロントのリファクタリング
## 今後実装したい機能
- トップページで表示する口座の情報に、総資産額、投資額、利益の表示
- 資産額と投資額のそれぞれの記録の一覧ページ、また、月ごとに一覧の表示
- トップページにて口座の順番が上から新しいものになっているが、自由に変更できる機能



# テーブル設計

## users テーブル 

| Column             | Type       | Options                   |
| ------------------ | ---------- | ------------------------- |
| nickname           | string     | null: false               |
| email              | string     | null: false, unique :true |
| encrypted_password | string     | null: false               |

### Association

- has_many :accounts

## accounts テーブル 

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| name               | string     | null: false                    |
| info               | string     |                                |

### Association

- belongs_to :user
- has_many :assets
- has_many :movements

## assets テーブル 

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| account  | references | null: false, foreign_key: true |
| amount   | integer    | null: false                    |
| date     | date       | null: false                    |

### Association

- belongs_to :account

## movements テーブル 

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| account  | references | null: false, foreign_key: true |
| amount   | integer    | null: false                    |
| date     | date       | null: false                    |


### Association

- belongs_to :account
