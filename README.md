# README

# テーブル設計

## users テーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| password         | string  | null: false               |
| family_name      | string  | null: false               |
| first_name       | string  | null: false               |
| family_name_kana | string  | null: false               |
| first_name_kana  | string  | null: false               |
| data_of_birth    | integer | null: false               |

### Association
has_many: items
has_one: shipping_addresses


## shipping_addresses テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| post_code        | integer | null: false       |
| prefecture       | string  | null: false       |
| city             | string  | null: false       |
| house_number     | string  | null: false       |
| building_name    | string  |                   |
| phone            | integer | null: false       |
| user_id          | integer | foreign_key: true |

### Association
belongs_to: user


## items テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| item_name        | string  | null: false       |
| description      | text    | null: false       |
| price            | integer | null: false       |
| category         | string  | null: false       |
| condition        | string  | null: false       |
| delivery_fee     | string  | null: false       |
| ship_from        | string  | null: false       |
| shipping_day     | string  | null: false       |
| user_id          | string  | foreign_key: true |

### Association
belongs_to: user