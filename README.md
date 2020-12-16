## users

| Column           | Type    | Options                   | 
| ---------------- | ------- | ------------------------- | 
| nickname         | string  | null: false, unique: true | 
| mail             | string  | null: false, unique: true | 
| password         | integer | null: false               | 
| family_name      | string  | null: false               | 
| first_name       | string  | null: false               | 
| family_name_kana | string  | null: false               | 
| first_name_kana  | string  | null: false               | 
| birth_year       | integer | null: false               | 
| birth_month      | integer | null: false               | 
| birth_day        | integer | null: false               | 

### Association
has_many :items
has_many :phachase_records

## items

| Column                     | Type    | Options                        | 
| -------------------------- | ------- | ------------------------------ | 
| item_name                  | string  | null: false                    | 
| price                      | integer | null: false                    | 
| description                | text    | null: false                    | 
| image                      | string  | null: false                    | 
| category                   | string  | null: false                    | 
| condition                  | string  | null: false                    | 
| delivery_fee               | string  | null: false                    | 
| shipment_source_prefecture | string  | null: false                    | 
| days_to_ship               | integer | null: false                    | 
| user_id                    | integer | null: false, foreign_key: true | 
| purchase_record_id         | integer | foreign_key: true              | 

### Association
belongs_to :user
has_one :phachase_record

## purchase_records

| Column              | Type    | Options                        | 
| ------------------- | ------- | ------------------------------ | 
| user_id             | integer | null: false, foreign_key: true | 
| item_id             | intefer | null: false, foreign_key: true | 
| shipping_address_id | integer | null: false, foreign_key: true | 

### Association
belongs_to :user
belongs_to :phachase_record
has_one :shipping_address

## shipping_addresses

| Column       | Type    | Options     | 
| ------------ | ------- | ----------- | 
| postal_code  | string  | null: false | 
| prefecture   | string  | null: false | 
| city         | string  | null: false | 
| address_line | string  | null: false | 
| building     | string  |             | 
| phone_number | string  | null: false | 

### Association
belongs_to :phachase_record