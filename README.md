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
- has_many : comments
- has_many : purchaserecords
- belong_to : sellers

##purchaserecordsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| purchaserecord_id | integer	| null: false |
| user_id         | integer	| null: false foreign_key: true |
| product_id        | integer	| null: false |foreign_key: true |
| totalprice          | integer	| null: false |
| shippingstatus       | string	| null: false |


### Association

- belongs_to :user
- belongs_to :produst


##commentsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| comment_id	| integer	| null |
| product_id	| integer	| null: false foreign_key: true|
| user_id	| integer	| null: false foreign_key: true|
| content	| text	| null: false |

### Association

- belongs_to :user
- belongs_to :product



##produstテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| product_id (PK)       |integer	| null |
| sellerI_id (FK)        | integer	| null: false foreign_key: true |
| category              |string	| null: false |
| condition             |string	| null: false |
| shipping_cost          | integer	| null |
| shipping_origin        |string	| null: false |
| shipping_estimate      |string	| null: false |

### Association

- belongs_to :user
- belongs_to :seller
- has_many :purchaserecords
- has_many :comments


