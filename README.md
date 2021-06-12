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

| Column               |
|----------------------|
| name                 |
| email                |
| password             |
| psddword again       |
| name full-width      |
| name kana full-width |
| birthday             |

## Comment テーブル

| Column               |
|----------------------|
| comment              |
| user_id              |
| item_id              |

## Items テーブル

| Column               |
|----------------------|
| product image        |
| product name         |
| product descriiption |
| product descriiption |
| category             |
| product condition    |
| shipping charges     |
| delivery area        |
| days to delivery     |
| price                |
| user_id              |

## Purchase テーブル

| Column               |
|----------------------|
| card information     |
| expiration date      |
| security code        |
| postal code          |
| prefectures          |
| municipality         |
| address              |
| building name        |
| phone number         |
| user_id              |