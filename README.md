# README
##usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email	| string	| null: false, unique: true |
| encrypted_password	| string	null: false |
| nickname	| string	| null: false |
| birthday	| date	| null: false |
| last_name	| string	| null: false |
| first_name	| string	| null: false |
| last_name_kana	| string	| null: false |
| first_name_kana	| string	| null: false |

### Association

- has_many : products 
- has_many : purchaserecords


##purchaserecordsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id         | integer	| null: false foreign_key: true |
| product_id        | integer	| null: false |foreign_key: true |



### Association

- belongs_to :user
- belongs_to :shippingaddres
- belong_to : product 


##shippingaddresesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- | 
| user_id	| integer	| null: false foreign_key: true|
| recipentname	| string	| null: false, unique: true |
| postal-code	| integer	| null: false |
| prefecture	| string	| null: false |
| city	| text	| null: false |
| streetaddres	| text	| null: false |
| buildingname	| text	| null: false |
| phonenumber	| integer	| null: false |
| purchaserecord_id	| integer	| null: false |

### Association

- belong_to :purchaserecords



##produstテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| category              |string	| null: false |
| condition             |string	| null: false |
| shipping_cost          | integer	| null |
| shipping_region        | string	| null: false
| shipping_time | string	| null: false
| productname | string	| null: false
| productdescription | string	| null: false
| price | integer	| null |

### Association

- belongs_to :user
- has_many :purchaserecords


