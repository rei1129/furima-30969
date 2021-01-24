# テーブル設計

## users テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| email           | string | null: false |
| password        | string | null: false |
| name            | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| day_of_birth    | datetime| null: false|


## items テーブル

| Column                   | Type       | Options    |
| ------------             | ---------- | -----------|
| item-name                | string     | null: false|
| item-text                | text       | null: false|
| item-shipping-fee-status | string     | null: false|
| item-prefecture          | string     | null: false|
| item-scheduled-delivery  | string     | null: false|
| item-price               | integer    | null: false|
| tax-price                | integer    | null: false|
| profit                   | integer    | null: false|
| image                    | ActiveStorageで実装|
| user                     | references | |


## item_categories テーブル

| Column                   | Type       | Options    |
| ------------             | ---------- | -----------|
| category                 | string型   | null: false|
| sales-status             | string型   | null: false|
| item                     | references | |


## comments テーブル
| Column   | Type      | Options     |
| -------- | ------    | ----------- |
| text     | text      | null: false |
| user     | references| |
| item     | references|  |

## buyersテーブル
| Column          | Type      | Options     |
| ------------    | ------    | ----------- |
| postal_code     | text      | null: false |
| prefecture      | text      | null: false |
| city            | text      | null: false |
| address         | text      | null: false |
| building        | text      | null: false |
| phone-number    | text      | null: false |
| user            | references | |
| item            | references | |


## purchase_historiesテーブル
| Column          | Type      | Options     |
| ------------    | ------    | ----------- |
| carded_at       | integer   | null: false |
| price           | integer   | null: false |
| user            | references | |
| item            | references | |
