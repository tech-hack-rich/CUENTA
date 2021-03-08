# アプリ名
CUENTA　　　　　スペイン語で（数える、口座）などの意味があります
# 概要
CUENTAは
一人のユーザーは複数の口座を登録でき、口座には資産額の記録と投資額の記録が作成でき、それらの直近の記録に基づいて現在の利益と利益率が見れます。

口座は、「FXの口座」「株の口座」「仮想通貨の口座」など、種類別に登録し、それぞれの詳細ページで投資額と資産額の記録が日付と一緒に保存できるようになっています。保存した最新の記録に基づいて、利益と利益率が詳細ページのトップ部分で見ることができます。
# 本番環境
URL：https://my-cuenta.herokuapp.com/
# 制作背景(意図)
私は投資初心者で、初心者のような私でも見やすい資産管理アプリを探していましたが、なかなか思うような、シンプルで見やすい物がなく、ずっとあればいいなと思っていました。そこで今回は初心者にやしいアプリケーションを作ろうと思いました。従来の資産管理アプリケーションは、今回の「口座機能」のように、種類別で記録が一覧表示されている物がなく、正直初心者には見づらい表示になっていたので、今回は以下の2点にフォーカスして作成しました。

- 今回の「口座」のように投資の種類や銘柄ごとに資産の記録が残せて、それぞれの利益が見やすいシンプルな表示
- 私のような投資初心者でも見やすくするために、最低限の情報のみを表示

# DEMO

## トップページ（口座一覧表示画面）
![3f79a8de0f4d84b8fb6a7aee4cfde616](https://user-images.githubusercontent.com/77149493/109939682-a66e5a80-7d14-11eb-8ee6-dc06e572fcd8.jpg)
![トップページ2](https://user-images.githubusercontent.com/77149493/109942561-a754bb80-7d17-11eb-81dc-f71348a663fc.jpg)

- ヘッダーの右側のボタンは、ユーザーのログイン状態によって、表示を変えています。ログイン状態では、ユーザーの名前と口座作成ボタン（CUENTA作成ボタン）が表示されており、そこから作成ページへと遷移できます。
- 白枠の部分をクリックすると、該当する口座の詳細ページに遷移できます。
- トップページではログインしている場合、ログインユーザーの口座を表示しますが、していない場合は口座がどのように表示されるかの一例が表示されます。
- フッター部分では、まだ未実装ですが、仮想通貨取引所のURLを指定して、クリックで飛べるように実装予定です。

## ユーザー新規登録画面
![新規登録画面1](https://user-images.githubusercontent.com/77149493/109942580-ad4a9c80-7d17-11eb-8bf5-1095e6a49cf7.jpg)
![新規登録画面2](https://user-images.githubusercontent.com/77149493/109942584-ade33300-7d17-11eb-9422-61eda3db6920.jpg)

- 気軽に利用していただけるように、ユーザーの新規登録は最低限の情報でできるようにしています。

## 口座作成ページ（CUENTA作成ページ）
![口座作成画面](https://user-images.githubusercontent.com/77149493/109942574-ab80d900-7d17-11eb-953c-3dafceaf4ad3.jpg)

- 口座の名前と説明が登録できます。
- 口座の説明は空白でも登録可能です。説明文は存在する場合のみ、口座の詳細ページにて口座名の下に表示されます。

## 口座詳細ページ（口座詳細ページ）
![詳細ページ](https://user-images.githubusercontent.com/77149493/109942576-acb20600-7d17-11eb-86be-6949a06115ec.jpg)

- トップ部分の編集/削除　ボタンでは、口座の編集と削除ができます。
- トップ部分には、一番新しい資産額と投資額の情報と、それに基づいて利益を表示するようにしています。
- 資産記録、投資記録の表示スペースでは、それぞれの金額が登録でます。日付はデフォルトで当日の日付が入ります。
- 資産記録、投資記録の表示スペースでは、今まで登録した金額と日付が、一覧で表示されます。
- 削除ボタンをクリックすると、該当する記録を削除することができます。


# 工夫したポイント
- 投資の種類や銘柄ごとに口座が作成できて、トップページにその一覧を表示することで、編集したい口座を選びやすいようにしました。
- 気軽に利用できるように、新規登録に必要とする情報は最低限にしました。
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
- 詳細ページで表示している、金額のカンマ区切り表示
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
