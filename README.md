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
