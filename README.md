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
|main_address         |string  |null: false, unique: true|
|password             |string  |null: false              |
|password_confirmation|string  |null: false              |
|family_name          |string  |null: false              |
|first_name           |string  |null: false              |
|family_name_kana     |string  |null: false              |
|first_name_kana      |string  |null: false              |
|birthday             |date    |null: false              |
### Association

- has_one :buyer
- has_many :items
- has_many :comments


## items テーブル

| Column        | Type       | Options                        |
| ------        | ------     | -----------                    |
|image          | string     | null: false                    |
|name           | string     | null: false                    |
|text           | string     | null: false                    |
|category       | string     | null: false                    |
|status         | string     | null: false                    |
|delivery_charge| string     | null: false                    |
|delivery_area  | string     | null: false                    |
|delivery_date  | string     | null: false                    |
|price          | string     | null: false                    |
|user_id        | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- has_many :comments

## buyers テーブル

| Column       | Type       | Options                        |
| ------       | --------   | ---------------------------    |
|post_code     | string     | null: false                    |
|prefecture    | string     | null: false                    |
|city          | string     | null: false                    |
|street_address| string     | null: false                    |
|building      | string     |                                |
|phone_number  | string     | null: false                    |
|user_id       | references | null: false, foreign_key: true |
### Association

- belongs_to :user


## comments テーブル

| Column  | Type       | Options                        |
| ------- | --------   | ------------------------------ |
|text     | string     | null: false                    |
|user_id  | references | null: false, foreign_key: true |
|items_id | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :comment