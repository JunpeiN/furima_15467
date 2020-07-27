# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| name             | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birth_year       | integer | null: false |
| birth_month      | integer | null: false |
| birth_day        | integer | null: false |

### Association
- has_many :products
- has_many :buyers

## products テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| img            | string  | null: false |
| price          | integer | null: false |
| user_id        | references | null: false, foreign_key: true |
| delivery_cost  | string  | null: false |
| prefectures    | string  | null: false |
| until_shipping | string  | null: false |
| category       | string  | null: false |
| status         | string  | null: false |


### Association
- belong_to :user
- belong_to :buyer

## buyers テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| card_number      | integer | null: false |
| expiration_year  | integer | null: false |
| expiration_month | integer | null: false |
| security_code    | integer | null: false |
| postal_code      | integer | null: false |
| prefectures      | string  | null: false |
| city             | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| phone_number     | integer | null: false |
| user_id          | references | null: false, foreign_key: true |
| product_id       | references | null: false, foreign_key: true |



### Association
- belong_to :user
- belong_to :product

