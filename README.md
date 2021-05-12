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
| data_of_birth    | date    | null: false               |

### Association
has_many: items
has_many: purchase_record

## buyers テーブル

| column           | Type      | Options           |
| ---------------- | --------- | ----------------- |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
has_many: items
has_one: addresses
belongs_to: user



## addresses テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| post_code        | string  | null: false       |
| prefecture_id    | integer | null: false       |
| city             | string  | null: false       |
| house_number     | string  | null: false       |
| building_name    | string  |                   |
| phone            | string  | null: false       |
| purchase_record  | references | null: false, foreign_key: true |

### Association
belongs_to: purchase_record
belongs_to_active_hash: prefecture


## items テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| item_name        | string  | null: false       |
| description      | text    | null: false       |
| price            | integer | null: false       |
| category_id      | integer | null: false       |
| condition_id     | integer | null: false       |
| delivery_fee.id  | integer | null: false       |
| prefecture_id    | integer | null: false       |
| shipping_day_id  | integer | null: false       |
| user             | references | null: false, foreign_key: true |

### Association
belongs_to: user
belongs_to: purchase_record
belongs_to_active_hash: category
belongs_to_active_hash: condition
belongs_to_active_hash: delivery_fee
belongs_to_active_hash: prefecture
belongs_to_active_hash: shipping_day