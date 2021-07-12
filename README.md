# README

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

* ...


# テーブル設計

## users テーブル

| Column                 | Type   | Options                   |
| ---------------------- | ------ | ------------------------- |
| nickname               | string | null: false               |
| email                  | string | null: false, unique: true |
| encrypted＿password    | string | null: false               |
| first_name             | string | null: false               |
| last_name              | string | null: false               |
| first_name_kana        | string | null: false               |
| last_name_kana         | string | null: false               |
| birthday               | date   | null: false               |

### Association
- has_many: items
- has_many: purchases


## items テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| title                  | string     | null: false                    |
| detail                 | text       | null: false                    |
| category_id            | integer    | null: false                    |
| condition_id           | integer    | null: false                    |
| shipping_charges_id    | integer    | null: false                    |
| shipment_source_id     | integer    | null: false                    |
| shipping_days_id       | integer    | null: false                    |
| price                  | string     | null: false                    |
| user                   | references | null: false, foreign_key: true |

### Association
- has_one: purchase
- belongs_to: user


## ship_addresses テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| postal_code            | integer    | null: false                    |
| prefercture            | string     | null: false                    |
| city                   | string     | null: false                    |
| house_number           | string     | null: false                    |
| building_name          | string     |                                |
| phone_number           | integer    | null: false                    |
| purchaces              | references | null: false, foreign_key: true |

### Association
- belongs_to: purchase


## purchaces テーブル

| Column                 | Type       | Options                        |
| ---------------------- | ---------- | ------------------------------ |
| user                   | references | null: false, foreign_key: true |
| item                   | references | null: false, foreign_key: true |

### Association
- belongs_to: item
- belongs_to: user
- has_one: purchases