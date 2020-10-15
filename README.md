#　テーブル設計

## usersテーブル
| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name         | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_day          | date   | null: false               |

### Association

-has_many : items
-has_many : purchases

## itemsテーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| name             | string    | null: false                    |
| user             | reference | null: false, foreign_key: true |
| category_id      | integer   | null: false                    |
| condition_id     | integer   | null: false                    |
| postage_id       | integer   | null: false                    |
| shipping_days_id | integer   | null: false                    |
| prefecture_id    | integer   | null: false                    |
| price            | integer   | null: false                    |
| description      | text      | null: false                    |

### Association

-has_one :user
-has_one :purchase
-has_one_attached :image
-belongs_to_active_hash :category
-belongs_to_active_hash :condition
-belongs_to_active_hash :postage
-belongs_to_active_hash :shipping_days
-belongs_to_active_hash :prefecture

## purchasesテーブル

| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| item             | reference | null: false, foreign_key: true |
| user             | reference | null: false, foreign_key: true |

### Association

-has_one :user
-has_one :item
-has_one :address

## Addressテーブル
| Column           | Type      | Options                        |
| ---------------- | --------- | ------------------------------ |
| postal_code      | string    | null: false                    |
| prefecture_id    | reference | null: false, foreign_key: true |
| city             | string    | null: false                    |
| address          | string    | null: false                    |
| building         | string    |                                |
| phone            | string    | null: false, unique: true      |
| purchase         | reference | null: false, foreign_key: true |

### Association

-has_one :purchase