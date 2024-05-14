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

| Column              | Type   | Option                  |
| ------------------  | ------ | ---------               |
|nickname             |string  |null: false              |
|email                |string  |null: false, unique: true|
|encrypted_password   |string  |null: false              |
|family_name          |string  |null: false              |
|first_name           |string  |null: false              |
|family_name_kana     |string  |null: false              |
|first_name_kana      |string  |null: false              |
|birthday             |date    |null: false              |
### Association

- has_many :buyers
- has_many :items
- has_many :comments


## items テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
|image          | string     | null: false                    |
|name           | string     | null: false                    |
|content        | string     | null: false                    |
|category       | string     | null: false                    |
|status         | string     | null: false                    |
|delivery_charge| string     | null: false                    |
|delivery_area  | string     | null: false                    |
|delivery_date  | string     | null: false                    |
|price          | integer    | null: false                    |
|user           | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_many :comments
- has_one :buyer

## buyers テーブル

| Column       | Type       | Options                        |
| ------       | --------   | ---------------------------    |
|post_code     | string     | null: false                    |
|prefecture    | string     | null: false                    |
|city          | string     | null: false                    |
|street_address| string     | null: false                    |
|building      | string     |                                |
|phone_number  | string     | null: false                    |
|user          | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :item


## comments テーブル

| Column  | Type       | Options                        |
| ------- | --------   | ------------------------------ |
|text     | string     | null: false                    |
|user     | references | null: false, foreign_key: true |
|items    | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :comment