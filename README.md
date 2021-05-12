# README

# テーブル設計

## users テーブル

| Column           | Type    | Options                   |
| ---------------- | ------- | ------------------------- |
| nickname         | string  | null: false               |
| email            | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name      | string  | null: false               |
| first_name       | string  | null: false               |
| family_name_kana | string  | null: false               |
| first_name_kana  | string  | null: false               |
| data_of_birth    | datetime | null: false               |

### Association
has_many: items
has_one: buyers
has_one: shipping_addresses

## buyers テーブル

| column           | Type      | Options           |
| ---------------- | --------- | ----------------- |
| user_id          | references|                   |
| item_id          | references|                   |
| address_id       | references|                   |


### Association
has_one: buyer_addresses
belongs_to: user



## addresses テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| post_code        | integer | null: false       |
| prefecture.id    | integer | null: false       |
| city             | string  | null: false       |
| house_number     | string  | null: false       |
| building_name    | string  |                   |
| phone            | string  | null: false       |
| user_id          | references |                |

### Association
belongs_to: user
belongs_to_active_hash: prefecture


## items テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| item_name        | string  | null: false       |
| description      | text    | null: false       |
| price            | integer | null: false       |
| category.id      | integer | null: false       |
| condition.id     | integer | null: false       |
| delivery_fee.id  | integer | null: false       |
| prefecture.id    | integer | null: false       |
| shipping_day.id  | integer | null: false       |
| user_id          | references |               |

### Association
belongs_to: user
belongs_to_active_hash: category
belongs_to_active_hash: condition
belongs_to_active_hash: delivery_fee
belongs_to_active_hash: prefecture
belongs_to_active_hash: shipping_day