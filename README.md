<!-- # README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ... -->

# モデル設計

## users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| nick_name   | string | null: false |
| email       | string | null: false |
| password    | string | null: false |
| kanji_fam   | string | null: false |
| kanji_given | string | null: false |
| kana_fam    | string | null: false |
| kana_given  | string | null: false |
| birth       | date   | null: false |

### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| image     | string | null: false |
| item_name | string | null: false |
| introduce | string | null: false |
| type      | string | null: false |
| codition  | string | null: false |
| ship_fee  | string | null: false |
| ship_from | string | null: false |
| ship_date | string | null: false |
| price  | string | null: false |

### Association

- belongs_to :user

## shippong テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| postcode  | string | null: false |
| state     | string | null: false |
| city      | string | null: false |
| add_line  | string | null: false |
| building  | string | null: false |
| number    | string | null: false |

### Association

- belongs_to :user


## purchase テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| card_num  | string | null: false |
| expiry     | string | null: false |
| security  | string | null: false |

### Association

- belongs_to :user

