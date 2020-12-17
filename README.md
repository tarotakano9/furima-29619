## users

| Column             | Type    | Options                   | 
| ------------------ | ------- | ------------------------- | 
| nickname           | string  | null: false,              | 
| email              | string  | null: false, unique: true | 
| encrypted_password | string  | null: false               | 
| family_name        | string  | null: false               | 
| first_name         | string  | null: false               | 
| family_name_kana   | string  | null: false               | 
| first_name_kana    | string  | null: false               | 
| birth_date         | date    | null: false               | 

### Association
has_many :items
has_many :phachase_records

## items

| Column                        | Type    | Options                        | 
| ----------------------------- | ------- | ------------------------------ | 
| name                          | string  | null: false                    | 
| price                         | integer | null: false                    | 
| description                   | text    | null: false                    | 
| category_id                   | integer | null: false                    | 
| condition_id                  | integer | null: false                    | 
| delivery_fee_id               | integer | null: false                    | 
| prefecture_id                 | integer | null: false                    | 
| days_to_ship_id               | integer | null: false                    | 
| user_id                       | integer | null: false, foreign_key: true | 

### Association
belongs_to :user
has_one :phachase_record

## purchase_records

| Column              | Type    | Options                        | 
| ------------------- | ------- | ------------------------------ | 
| user_id             | integer | null: false, foreign_key: true | 
| item_id             | intefer | null: false, foreign_key: true | 

### Association
belongs_to :user
belongs_to :item
has_one :shipping_address

## shipping_addresses

| Column             | Type    | Options                        | 
| ------------------ | ------- | ------------------------------ | 
| postal_code        | string  | null: false                    | 
| prefecture_id      | integer | null: false                    | 
| city               | string  | null: false                    | 
| address_line       | string  | null: false                    | 
| building           | string  |                                | 
| phone_number       | string  | null: false                    | 
| phachase_record_id | integer | null: false, foreign_key: true |

### Association
belongs_to :phachase_record