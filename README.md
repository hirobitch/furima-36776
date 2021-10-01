## users テーブル

| Column             | Type    | Options                 |
| ------------------ | ------  | ----------------------- |
| name               | string  | null: false             |
| email              | string  | null: false unique: true|
| encrypted_password | string  | null: false             |
| last_name          | string  | null: false             |
| first_name         | string  | null: false             |
| last_name_kana     | string  | null: false             |
| first_name_kana    | string  | null: false             |
| birthday_year      | integer | null: false             |
| birthday_month     | integer | null: false             |
| birthday_day       | integer | null: false             |

### Association

- has_many :items
- has_many :purchase
 
## items テーブル

| Column              | Type       | Options                        |
| ------------------- | -----------| ------------------------------ |
| item_name           | string     | null: false                    |
| item_description    | text       | null: false                    |
| item_category       | string     | null: false                    |
| item_condition      | string     | null: false                    |
| delivery_fee        | integer    | null: false                    |
| ship_from_address   | string     | null: false                    |
| day_to_ship         | integer    | null: false                    |
| price               | integer    | null: false                    |
| buyer               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :purchases
- has_one :shipping_addresses
- 
## purchases テーブル

| Column              | Type       | Options                        |
| ------------------- | ------------------------------------------- |
| item_name           | string     | null: false                    |
| item_description    | string     | null: false                    |
| item_category       | string     | null: false                    | 
| item_condition      | string     | null: false                    |
| delivery_fee        | integer    | null: false                    |
| ship_from_address   | string     | null: false                    |
| day_to_ship         | integer    | null: false                    |
| price               | integer    | null: false                    |
| buyer               | references | null: false, foreign_key: true |
| seller              | references | null: false, foreign_key: true |


### Association

- belongs_to :users
- belongs_to :items

## shipping_addresses テーブル 

| Column            | Type   | Options     |
| ----------------- | ------ | ------------|
| postal_code       | string | null: false |
| prefectures       | string | null: false |
| municipalities    | string | null: false |
| address           | string | null: false |
| building          | string | null: false |
| tell              | string | null: false |
| seller            | string | null: false |
### Association

- belongs_to :items