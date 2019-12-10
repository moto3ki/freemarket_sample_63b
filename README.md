# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation
## 1. users Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|profile|text|
|email|string|null: false, unique: true|
|image|string|
|kanji_last_name|string|null: false|
|kanji_first_name|string|null: false|
|kana_last_name|string|null: false|
|kana_first_name|string|null: false|
|birth_day|date|null: false|
|tel_no|string|
|sales|integer|default: 0|

### Association
- has_many :items
- has_many :comments
- has_many :credit_cards
- has_many  :purchases
- has_many :likes
- has_many :liked_items, through: :likes, source: :item
- has_many :rates
- has_many :ratings, through: :rates, source: :rated_user
- has_one  :send_address
- has_one  :real_address
- has_many :sns_credentials, dependent: :destroy


## 2. credit_cards Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association
- belongs_to :user


## 3. rates Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|rated_user_id|integer|null: false, foreign_key: {to_table: :users}|
|rate_type|integer|null: false|

### Association
- belongs_to :user
- belongs_to :rated_user, class_name: 'User'


## 4. items Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|name|string|null: false, index: true|
|explain|text|null: false|
|status|integer|null: false, index: true|
|condition|integer|null: false, index: true|
|delivery_charge|integer|null: false|
|delivery_method|integer|null: false|
|prefecture_id|integer|null: false, foreign_key: true|
|delivery_period|integer|null: false, index: true|
|price|integer|null: false, index: true|
|like_cnt|integer|null: false|
|category_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- has_many :item_images, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user
- has_one  :purchase, dependent: :destroy


## 5. item_images Table
|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|image|string|null: false|

### Association
- belongs_to :item


## 6. comments Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|string|null: false|

### Association
- belongs_to :user
- belongs_to :item


## 7. likes Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item


## 8. categories Table
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|

### Association
- has_many :items
- has_ancestry


## 9. send_address Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|

### Association
- belongs_to :user


## 10. real_address Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|post_code|string|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building_name|string|

### Association
- belongs_to :user


## 11. purchases Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|price|integer|default: 0|
|profit|integer|default: 0|
|pay_flg|integer|

### Association
- belongs_to :user
- belongs_to :item

## 12. sns_credentials Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|uid|string|
|provider|string|

### Association
- belongs_to :user,optional: true


## 13. sales_management Table
|Column|Type|Options|
|------|----|-------|
|sales|integer|default: 0|
|profit|integer|default: 0|

### Association


## 14. sales_commission Table
|Column|Type|Options|
|------|----|-------|
|rate|integer|null: false
|adapt_date|date|

### Association


## 15. todolists Table
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|status|integer|default: 0|
|title|string|null: false|
|content|text|
|date|date|

### Association
- belongs_to :user


* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
