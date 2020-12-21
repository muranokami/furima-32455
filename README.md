#  DB設計

##  users table

| Column   | Type   | Options     |
|----------|--------|-------------|
| email    | string | null: false |
| nickname | string | null: false |
| password | string | null: false |
| birthday | string | null: false |
| name     | string | null: false |

### Association

- belongs_to :items
- has_one :purchases

## items table

| Column     | Type   | Options     |
|------------|--------|-------------|
| product    | text   | null: false |
| category   | text   | null: false |
| price      | text   | null: false |
| seller     | text   | null: false |

### Association

- belongs_to :users
- has_one :purchases

## purchases

| Column           | Type | Option            |
|------------------|------|-------------------|
| shipping address | text | foreign_key: true |

### Association

- has_one :users
- has_one :items