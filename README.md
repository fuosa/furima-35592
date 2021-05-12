# README

# テーブル設計

<<<<<<< Updated upstream
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
has_many: purchase_records

## purchase_records テーブル

| column           | Type      | Options           |
| ---------------- | --------- | ----------------- |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association
has_one: address
belongs_to: user
belongs_to: item


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



## items テーブル

| column           | Type    | Options           |
| ---------------- | ------- | ----------------- |
| item_name        | string  | null: false       |
| description      | text    | null: false       |
| price            | integer | null: false       |
| category_id      | integer | null: false       |
| condition_id     | integer | null: false       |
| delivery_fee_id  | integer | null: false       |
| prefecture_id    | integer | null: false       |
| shipping_day_id  | integer | null: false       |
| user             | references | null: false, foreign_key: true |

### Association
belongs_to: user
has_one: purchase_record
=======
## users テーブル
>>>>>>> Stashed changes
