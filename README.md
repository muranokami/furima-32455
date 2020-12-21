#  DB設計

##  users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column                 | Type       | Options                        |
|------------------------|------------|--------------------------------|
| name                   | string     | null: false                    |
| category_id            | integer    | null: false                    |
| price                  | integer    | null: false                    |
| user                   | references | null: false, foreign_key: true |
| explanation            | text       | null: false                    |
| product_status_id      | integer    | null: false                    |
| shipping_fee_burden_id | integer    | null: false                    |
| shipping_area_id       | integer    | null: false                    |
| shipping_days_id       | integer    | null: false                    |




### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column           | Type       | Option                         |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_one :user
- belongs_to :item
- has_one :addresses

## addresses

| Column          | Type         | Option                         |
|-----------------|--------------|--------------------------------|
| post            | string       | null: false                    |
| prefecture_id   | integer      | null: false                    |
| municipalitie   | string       | null: false                    |
| address         | string       | null: false                    |
| building_name   | string       |                                |
| phone_number    | string       | null: false                    |
| purchase        | references   | null: false, foreign_key: true |

### Association

- belongs_to :purchase
