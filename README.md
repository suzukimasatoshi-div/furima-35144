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

## useres テーブル

| Column                               | Type   |Options                    |
|--------------------------------------|--------|---------------------------|
| name                                 | string | null: false               |
| email                                | string | null: false, unique: true |
| encrypted_password                   | string | null: false               |
| first_name_full-width                | string | null: false               |
| first_name_kana_full-width           | string | null: false               |
| last_name_full-width                 | string | null: false               |
| last_name_kana_full-width            | string | null: false               |
| date                                 | string | null: false               |

## Association
- has_many :comments
- has_many :items
- has_many :purchase

## Comment テーブル

| Column            | Type       | Options                                    |
|-------------------|------------|--------------------------------------------|
| comment           | text       | null: false                                |
| user              | references | null: false, foreign_key: true             |
| item              | references | null: false, foreign_key: true             |

## Association
- has_many :items
- belongs_to :user

## Items テーブル

| Column               | Type       | Options                         |
|----------------------|------------|---------------------------------|
| product_name         | string     | null: false                     |
| product_descriiption | text       | null: false                     |
| category             | string     | null: false                     |
| product_condition    | text       | null: false                     |
| price                | integer    | null: false                     | 
| shipping_charges     | string     | null: false                     |
| delivery_area        | string     | null: false                     | 
| days_to_delivery     | datetime   | null: false                     |
| user                 | references | null: false, foreign_key: true  |

## Association
- belongs_to :user
- belongs_to :comment
- belongs_to :purchase

## Purchase テーブル

| Column               | Type       | Options                                   |
|----------------------|------------|-------------------------------------------|
| user                 | references | null: false, foreign_key: true            |
| item                 | references | null: false, foreign_key: true            |

## Association
- belongs_to :user
- belongs_to :items

## Shipping address テーブル

| Column               | Type       | Options                                 |
|----------------------|------------|-----------------------------------------|
| postal_code          | integer    | null: false                             |
| prefectures          | string     | null: false                             |
| municipality         | string     | null: false                             |
| address              | integer    | null: false                             |
| building_name        | string     | null: false                             |
| phone_number         | integer    | null: false                             |
| user                 | references | null: false, foreign_key: true          |  

## Association
- belongs_to purchase
