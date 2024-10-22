# README
##usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email	| string	| null: false, unique: true |
| encrypted_password	| string	null: false |
| nickname	| string	| null: false |
| birthday	| date	| null: false |
| tel	| string	| null: false |
| self_introduction	| text |	
| last_name	| string	| null: false |
| first_name	| string	| null: false |
| last_name_kana	| string	| null: false |
| first_name_kana	| string	| null: false |

### Association

- has_many : products dependent: :destroy
- belongs_to :destination dependent: :destroy
- belongs_to :card dependent: :destroy

##destinationテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id	| integer	| null: false, foreign_key: true |
| family_name	| string	| null: false |
| first_name	| string	| null: false |
| family_name_kana	| string	| null: false |
| first_name_kane	s| tring	| null: false |
| post_code	| string	| null: false |
| prefecture	| string	| null: false |
| city	| string	| null: false |
| address	| string	| null: false |
| tel	| string |

### Association

- belongs_to :user

##cardテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| user_id	| integer	| null: false, foreign_key: true |
| customer_id	| string	| null: false |
| card_id	| string	| null: false |

### Association

- belongs_to :user

##categoryテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name	| string	| null: false |
| ancestry	| string |	

### Association

- has_many : products

##produstテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name	| string	| null: false |
| price	| string	| null: false |
| description	| string	| null: false |
| status	| string	| null: false |
| size	| string	| null: false |
| shipping_cost	| string	| null: false |
| shipping_days	| string	| null: false |
| prefecture_id	string	| null: false |
| category_id	| integer	| null: false, foreign_key: true |
| brand_id	| integer	| null: false, foreign_key: true |
| shipping_id	| integer	| null: false, foreign_key: true |
| user_id	| integer	| null: false, foreign_key: true |

### Association

- belongs_to :user dependent: :destroy

- belongs_to :category dependent: :destroy

- belongs_to :brand dependent: :destroy

- has_many :images dependent: :destroy

- belongs_to_active_hash :prefecture


##imagesテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| image	| string	| null: false |
| product_id	| integer	| null: false, foreign_key: true |


##brandsテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name	| string	| index: true |

### Association

- has_many : products