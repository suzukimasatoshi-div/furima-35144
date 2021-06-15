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
| birthday                             | date   | null: false               |

## Association
- has_many :comments
- has_many :items
- has_many :purchases

## Comment テーブル

| Column            | Type       | Options                                    |
|-------------------|------------|--------------------------------------------|
| comment           | text       | null: false                                |
| user              | references | null: false, foreign_key: true             |
| item              | references | null: false, foreign_key: true             |

## Association
- has_many   :items
- belongs_to :user

## Items テーブル

| Column                   | Type       | Options                         |
|--------------------------|------------|---------------------------------|
| product_name             | string     | null: false                     |
| product_descriiption     | text       | null: false                     |
| category_id              | integer    | null: false                     |
| product_condition_id     | integer    | null: false                     |
| price                    | integer    | null: false                     | 
| shipping_charges_id      | integer    | null: false                     |
| delivery_area_id         | integer    | null: false                     | 
| days_to_delivery_id      | integer    | null: false                     |
| user                     | references | null: false, foreign_key: true  |

## Association
- belongs_to :user
- belongs_to :comment
- has_one    :purchase

## Purchase テーブル

| Column               | Type       | Options                                   |
|----------------------|------------|-------------------------------------------|
| user                 | references | null: false, foreign_key: true            |
| item                 | references | null: false, foreign_key: true            |

## Association
- belongs_to :user
- belongs_to :item
- has_one :address

## Shipping address テーブル

| Column               | Type       | Options                                 |
|----------------------|------------|-----------------------------------------|
| postal_code          | string     | null: false                             |
| prefectures          | integer    | null: false                             |
| municipality         | string     | null: false                             |
| address              | string     | null: false                             |
| building_name        | string     |                                         |
| phone_number         | string     | null: false                             |
| purchase             | references | null: false                             |  

## Association
- belongs_to purchase
