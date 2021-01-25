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
| day_of_birth       | datetime| null: false|
### Association
has_many :items
has_many :purchase_histories
has_many :comments 


## items テーブル
| Column                   | Type       | Options    |
| --------------------     | ---------- | -----------|
| name                     | string     | null: false|
| text                     | text       | null: false|
| category_id              | integer型  | null: false| 
| sales-status_id          | integer型  | null: false| 
| shipping-fee-status_id   | integer型  | null: false| 
| prefecture_id            | integer型  | null: false|  
| scheduled-delivery_id    | integer型  | null: false| 
| price                    | integer    | null: false| 
| tax-price                | integer    | null: false|
| profit                   | integer    | null: false| 
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
| item     | references|  |
### Association
belongs_to :item
belongs_to :user



## purchase_historiesテーブル
| Column          | Type      | Options     |
| ------------    | ------    | ----------- |
| carded_at       | integer   | null: false |
| price           | integer   | null: false |
| user            | references | |
| item            | references | |
### Association
belongs_to :user
belongs_to :item
has_one :address

## addressesテーブル
| Column          | Type      | Options     |
| ------------    | ------    | ----------- |
| postal_code     | text      | null: false |
| prefecture_id   | integer型  | null: false |
| city            | text      | null: false |
| address         | text      | null: false |
| building        | text      | null: false |
| phone-number    | integer   | null: false |
| user            | references | |
| item            | references | |
### Association
belongs_to :purchase_history