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

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nick_name | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| kanji     | string | null: false |
| katakana  | string | null: false |
| birth     | string | null: false |

### Association

- has_many :items
- has_many :purchase
- has_one :shipping





