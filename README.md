## users テーブル

| Column             | Type    | Options                  |
| ------------------ | ------- | ------------------------ |
| name               | string  | null: false              |
| email              | string  | null: false unique: true |
| encrypted_password | string  | null: false              |
| last_name          | string  | null: false              |
| first_name         | string  | null: false              |
| last_name_kana     | string  | null: false              |
| first_name_kana    | string  | null: false              |
| birthday           | date    | null: false              |
### Association

- has_many :items   
- has_many :purchases
 
## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| item_name            | string     | null: false                    |
| item_description     | text       | null: false                    |
| item_category_id     | integer    | null: false                    |
| item_condition_id    | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| ship_from_address_id | integer    | null: false                    |
| day_to_ship_id       | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | string     | null: false                    |
| item_category       | string     | null: false                    | 
| item_condition      | string     | null: false                    |
| delivery_fee        | integer    | null: false                    |
| ship_from_address   | string     | null: false                    |
| day_to_ship         | integer    | null: false                    |
| price               | integer    | null: false                    |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address

## shipping_addresses テーブル 

| Column               | Type       | Options                        |
| -----------------    | ---------- | ------------------------------ |
| postal_code          | string     | null: false                    |
| ship_from_address_id | integer    | null: false                    |
| municipalities       | string     | null: false                    |
| address              | string     | null: false                    |
| building             | string     |                                |
| tell                 | string     | null: false                    |
| purchase             | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase