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
- has_many :purchases

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| introduce    | text    | null: false |
| type_id      | integer | null: false |
| codition_id  | integer | null: false |
| ship_fee_id  | integer | null: false |
| ship_from_id | integer | null: false |
| ship_date_id | integer | null: false |
| price        | integer | null: false |

### Association

- belongs_to :user

## shippong テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| postcode  | string | null: false |
| state     | string | null: false |
| city      | string | null: false |
| add_line  | string | null: false |
| building  | string |             |
| number    | string | null: false |

### Association

- belongs_to :purchase


## purchase テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| user      | string | null: false |
| item      | string | null: false |
| bought_at | date | null: false |

### Association

- belongs_to :user
- has_many :shipping
