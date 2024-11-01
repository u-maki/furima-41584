# README
## usersテーブル

| Column              | Type   | Options     |
| ------------------  | ------ | ----------- |
| email	              | string | null: false, unique: true |
| encrypted_password	| string | null: false |
| nickname	          | string | null: false |
| birthday	          | date	 | null: false |
| last_name	          | string | null: false |
| first_name	        | string | null: false |
| last_name_kana	    | string | null: false |
| first_name_kana	    | string | null: false |

### Association

- has_many : items 
- has_many : purchase_records


## purchase_recordsテーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping_addressesテーブル

| Column             | Type      | Options     |
| ------------------ | --------- | ----------- | 
| purchase_record    |references |null: false, foreign_key: true |
| postal_code	       | string    | null: false |
| prefecture_id	     | integer   | null: false |
| city	             | string    | null: false | 
| street_address     | string    | null: false |
| building_name      | string    | 
| phone_number	     | string    | null: false |

### Association

- belongs_to :purchase_record



## itemsテーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| category_id        | integer | null: false |
| condition_id       | integer | null: false |
| shipping_cost_id   | integer | null: true  |
| prefecture_id      | integer | null: false |
| shipping_time_id   | integer | null: false |
| product_name       | string  | null: false |
| product_description | text   | null: false |
| price              | integer | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase_record
- has_one_attached :image


