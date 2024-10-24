# README
##usersテーブル

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

- has_many : products 
- has_many : purchase_records


##purchase_recordsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user               | integer| null: false, foreign_key: true |
| product            | integer| null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :shipping_address
- belongs_to :product 


##shipping_addressesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- | 
| recipient_name	   | string | null: false, unique: true |
| postal_code	       | integer| null: false |
| prefecture	       | string	| null: false, foreign_key: true|
| city	             | string	| null: false | 
| street_address     | string	| null: false |
| building_name      | string	| 
| phone_number	     | string	| null: false |

### Association

- belongs_to :purchase_record



##productsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| category           | string	| null: false |
| condition          | string	| null: false |
| shipping_cost      | integer| null: true  |
| shipping_region    | string	| null: false |
| shipping_time      | string	| null: false |
| product_name       | string	| null: false |
| productdescription | text	  | null: false |
| price              | integer| null        |
| image              | string | null: false |

### Association

- belongs_to :user
- belongs_to :purchase_record


