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
- has_many :addresses

## items table

| Column     | Type       | Options                        |
|------------|------------|--------------------------------|
| name       | string     | null: false                    |
| category   | text       | null: false                    |
| price      | integer    | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases
- has_one :addresses

## purchases table

| Column           | Type       | Option                         |
|------------------|------------|--------------------------------|
| user             | string     | null: false, foreign_key: true |
| item             | string     | null: false, foreign_key: true |

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
| building name   | string       | null: false                    |
| phone number    | string       | null: false                    |
| purchase        | string       | null: false, foreign_key: true |

### Association

- has_one :purchases
- has_one :users
- has_one :items