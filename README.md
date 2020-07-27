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

## products テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| img            | string  | null: false |
| price          | integer | null: false |
| user_name      | string  | null: false |
| delivery_cost  | string  | null: false |
| prefectures    | string  | null: false |
| until_shipping | string  | null: false |
| category       | string  | null: false |
| status         | string  | null: false |


### Association
- belong_to :user