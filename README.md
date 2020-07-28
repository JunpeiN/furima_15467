# テーブル設計

## users テーブル

| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| nickname         | string  | null: false |
| email            | string  | null: false |
| password         | string  | null: false |
| family_name      | string  | null: false |
| first_name       | string  | null: false |
| family_name_kana | string  | null: false |
| first_name_kana  | string  | null: false |
| birthday         | data    | null: false |

### Association
- has_many :products
- has_many :addresses
- has_many :managements

## products テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| img            | string  | null: false |
| price          | integer | null: false |
| user           | references | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :addresses
- belong_to :management


## addresses テーブル
| Column           | Type    | Options     |
| ---------------- | ------- | ----------- |
| postal_code      | integer | null: false |
| city             | string  | null: false |
| address          | string  | null: false |
| building_name    | string  |             |
| phone_number     | string  | null: false |
| user          | references | null: false, foreign_key: true |
| product       | references | null: false, foreign_key: true |


### Association
- belong_to :user
- belong_to :product

## managements テーブル

| Column  | Type    | Options     |
| --------| ------- | ----------- |
| user    | references | null: false, foreign_key: true |
| product | references | null: false, foreign_key: true |


### Association
- belong_to :user
- belong_to :product