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

- has_many :items
- has_many :comments
- has_many :histories


## items テーブル

| Column           | Type       | Options                        |
| ------           | ------     | -----------                    |
|name              | string     | null: false                    |
|content           | text       | null: false                    |
|price             | integer     | null: false                   |
|category_id       | integer    | null: false                    |
|status_id         | integer    | null: false                    |
|delivery_charge_id| integer    | null: false                    |
|delivery_date_id  | integer    | null: false                    |
|prefecture_id     | integer    | null: false                    |
|user              | references | null: false, foreign_key: true |
### Association

- has_many :comments
- has_one :history
- has_one_active_hash :category
- has_one_active_hash :status
- has_one_active_hash :delivery_charge
- has_one_active_hash :delivery_date
- has_one_active_hash :prefecture
- belongs_to :user

## buyers テーブル

| Column       | Type       | Options                        |
| ------       | --------   | ---------------------------    |
|post_code     | string     | null: false                    |
|prefecture_id | integer    | null: false                    |
|city          | string     | null: false                    |
|street_address| string     | null: false                    |
|building      | string     |                                |
|phone_number  | string     | null: false                    |
|history       | references | null: false, foreign_key: true |
### Association

- belongs_to :history
- has_one_active_hash :prefecture


## comments テーブル

| Column  | Type       | Options                        |
| ------- | --------   | ------------------------------ |
|content  | string     | null: false                    |
|user     | references | null: false, foreign_key: true |
|item     | references | null: false, foreign_key: true |
### Association

- belongs_to :user
- belongs_to :comment


## histories テーブル

| Column  | Type       | Options                        |
| ------- | --------   | ------------------------------ |
|item     | references | null: false, foreign_key: true |
|user     | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :buyer