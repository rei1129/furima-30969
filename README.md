# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ---------------    | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| day_of_birth       | date   | null: false|
### Association
has_many :items
has_many :purchase_histories
has_many :comments 


## items テーブル
| Column                   | Type       | Options    |
| --------------------     | ---------- | -----------|
| name                     | string   | null: false|
| text                     | text     | null: false|
| category_id              | integer  | null: false| 
| sales_status_id          | integer  | null: false| 
| shipping_fee_status_id   | integer  | null: false| 
| prefecture_id            | integer  | null: false|  
| scheduled_delivery_id    | integer  | null: false| 
| price                    | integer  | null: false| 
| user                     | references | foreign_key: true|
### Association
belongs_to :user
has_many :comments
has_one purchase_history


## comments テーブル
| Column   | Type      | Options     |
| -------- | ------    | ----------- |
| text     | text      | null: false |
| user     | references| foreign_key: true|
| item     | references| foreign_key: true|
### Association
belongs_to :item
belongs_to :user


## purchase_historiesテーブル
| Column          | Type      | Options     |
| ------------    | ------    | ----------- |
| user            | references | foreign_key: true |
| item            | references | foreign_key: true|
### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル
| Column          | Type       | Options     |
| ------------    | -----      | ----------- |
| postal_code     | string   | null: false |
| prefecture_id   | integer  | null: false |
| city            | string   | null: false |
| address         | string   | null: false |
| building        | string   | null: false |
| phone_number    | string   | null: false |
| purchase_history| references | foreign_key: true|
### Association
belongs_to :purchase_history