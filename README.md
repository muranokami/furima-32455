#  DB設計

##  users table

| Column             | Type   | Options      |
|--------------------|--------|--------------|
| email              | string | unique: true |
| nickname           | string | null: false  |
| encrypted_password | string | null: false  |
| birthday           | date   | null: false  |
| name               | string | null: false  |
| mysterious         | string | null: false  |
| name(kana)         | string | null: false  |
| mysterious(kana)   | string | null: false  |

### Association

- has_many :items
- has_many :purchases

## items table

| Column     | Type   | Options     |
|------------|--------|-------------|
| product    | text   | null: false |
| category   | text   | null: false |
| price      | text   | null: false |
| seller     | text   | null: false |

### Association

- belongs_to :users
- has_many :purchases

## purchases

| Column           | Type | Option            |
|------------------|------|-------------------|
| shipping address | text | foreign_key: true |

### Association

- has_one :users
- has_many :items