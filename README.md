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
- has_many :items
- has_many :managements

## items テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| name           | string  | null: false |
| image          | string  | null: false |
| price          | integer | null: false |
| delivery_cost  | integer | null: false |
| prefecture     | integer | null: false |
| until_shipping | integer | null: false |
| category       | integer | null: false |
| status         | integer | null: false |
| description    | text    | null: false |
| user           | references | null: false, foreign_key: true |

### Association
- belong_to :user
- has_one :address
- has_one :management


## addresses テーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | integer | null: false |
| prefecture    | integer | null: false |
| city          | string  | null: false |
| address       | string  | null: false |
| building_name | string  |             |
| phone_number  | string  | null: false |
| item          | references | null: false, foreign_key: true |


### Association
- belong_to :item

## buyers テーブル

| Column  | Type    | Options     |
| --------| ------- | ----------- |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


### Association
- belong_to :user
- belong_to :item