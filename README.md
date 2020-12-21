#  DB設計

##  users table

| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| email              | string | null: false, unique: true |
| nickname           | string | null: false               |
| encrypted_password | string | null: false               |
| birthday           | date   | null: false               |
| name               | string | null: false               |
| mysterious         | string | null: false               |
| name_kana          | string | null: false               |
| mysterious_kana    | string | null: false               |

### Association

- has_many :items
- has_many :purchases

## items table

| Column              | Type       | Options                        |
|---------------------|------------|--------------------------------|
| name                | string     | null: false                    |
| category_id         | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| explanation         | integer    | null: false                    |
| product_status      | integer    | null: false                    |
| shipping_fee_burden | integer    | null: false                    |
| shipping area       | integer    | null: false                    |
| shipping days       | integer    | null: false                    |




### Association

- belongs_to :user
- has_one :purchase

## purchases table

| Column           | Type       | Option                         |
|------------------|------------|--------------------------------|
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |

### Association

- has_one :users
- belongs_to :items
- has_one :addresses

## addresses

| Column          | Type         | Option                         |
|-----------------|--------------|--------------------------------|
| post            | string       | null: false                    |
| prefectures     | string       | null: false                    |
| municipalities  | string       | null: false                    |
| address         | string       | null: false                    |
| building_name   | string       |                                |
| phone_number    | string       | null: false                    |
| purchase        | references   | null: false, foreign_key: true |

### Association

- has_one :purchase
