# テーブル設計

## users テーブル
| Column             | Type   | Options     |
| ---------------    | ------ | ----------- |
| name               | string型 | null: false |
| email              | string型 | null: false |
| encrypted_password | string型 | null: false |
| last_name          | string型 | null: false |
| first_name         | string型 | null: false |
| last_name_kana     | string型 | null: false |
| first_name_kana    | string型 | null: false |
| day_of_birth       | date型   | null: false|
### Association
has_many :items
has_many :purchase_histories
has_many :comments 


## items テーブル
| Column                   | Type       | Options    |
| --------------------     | ---------- | -----------|
| name                     | string型   | null: false|
| text                     | text型     | null: false|
| category_id              | integer型  | null: false| 
| sales-status_id          | integer型  | null: false| 
| shipping-fee-status_id   | integer型  | null: false| 
| prefecture_id            | integer型  | null: false|  
| scheduled-delivery_id    | integer型  | null: false| 
| price                    | integer型  | null: false| 
| tax-price                | integer型  | null: false|
| profit                   | integer型  | null: false| 
| user                     | references | |
### Association
belongs_to :user
has_many :comments
has_one purchase_histories


## comments テーブル
| Column   | Type      | Options     |
| -------- | ------    | ----------- |
| text     | text      | null: false |
| user     | references| |
| item     | references| |
### Association
belongs_to :item
belongs_to :user


## purchase_historiesテーブル
| Column          | Type      | Options     |
| ------------    | ------    | ----------- |
| user            | references | |
| item            | references | |
### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル
| Column          | Type       | Options     |
| ------------    | -----      | ----------- |
| postal_code     | string型   | null: false |
| prefecture_id   | integer型  | null: false |
| city            | string型   | null: false |
| address         | string型   | null: false |
| building        | string型   | null: false |
| phone-number    | string型   | null: false |
| purchase_history| references | |
### Association
belongs_to :purchase_history