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

| Column               | Type   |Options      |
|----------------------|--------|-------------|
| name                 | string | null: false |
| email                | string | null: false |
| password             | string | null: false |
| psddword again       | string | null: false |
| name full-width      | string | null: false |
| name kana full-width | string | null: false |
| birthday             | string | null: false |

## Association
- has_many :comments
- has_many :items
- belongs_to :purchase
- belongs_to :shipping address

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
| product image        |            |                                 |
| product name         | string     | null: false                     |
| product descriiption | text       | null: false                     |
| category             | string     | null: false                     |
| product condition    | text       | null: false                     |
| price                | integer    | null: false                     | 
| user                 | references | null: false, foreign_key: true  |

## Association
- belongs_to :user
- belongs_to :comment
- belongs_to shipping address


## Purchase テーブル

| Column               | Type       | Options                                   |
|----------------------|------------|-------------------------------------------|
| card information     | integer    | null: false                               |
| expiration date      | integer    | null: false                               |
| security code        | integer    | null: false                               |
| postal code          | integer    | null: false                               |
| prefectures          | string     | null: false                               |
| municipality         | string     | null: false                               |
| address              | integer    | null: false                               |
| building name        | string     | null: false                               |
| phone number         | integer    | null: false                               |
| user                 | references | null: false, foreign_key: true            |

## Association
- belongs_to :user

## Shipping address テーブル

| Column               | Type       | Options                                 |
|----------------------|------------|-----------------------------------------|
| shipping charges     | string     | null: false                             |
| delivery area        | string     | null: false                             | 
| days to delivery     | datetime   | null: false                             |
| user                 | references | null: false, foreign_key: true          |  

## Association
- belongs_to :user
- belongs_to item
