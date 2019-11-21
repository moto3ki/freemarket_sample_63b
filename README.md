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
|post_code|integer|
|real_adress|text|null: false|
|send_adress|text|
|tel_no|integer|

### Association
- has_many :items
- has_many :comments
- has_many :credit_cards
- has_many :likes
- has_many :liked_items, through: :likes, source: :item
- has_many :rates
- has_many :ratings, through: :rates, source: :rated_user


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
|buyer_id|integer|foreign_key: {to_table: :users}|
|name|integer|null: false, index: true|
|explain|text|null: false|
|status|integer|null: false, index: true|
|delivery_charge_type|integer|null: false|
|delivery_method_no|integer|null: false|
|from_area|string|null: false|
|delivery_ period_type|integer|null: false, index: true|
|price|integer|null: false, index: true|
|like_cnt|integer|null: false|
|category1_id|integer|null: false, foreign_key: true|
|category2_id|integer|foreign_key: true|
|category3_id|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category1
- belongs_to :category2
- belongs_to :category3
- has_many :item_images
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

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


## 8. category1s Table
|Column|Type|Options|
|------|----|-------|
|name|integer|null: false|

### Association
- has_many :items
- has_many :category2s


## 9. category2s Table
|Column|Type|Options|
|------|----|-------|
|category1_id|integer|null: false, foreign_key: true|
|name|integer|null: false|

### Association
- has_many :items
- has_many :category3s
- belongs_to :category1s

## 10. category3s Table
|Column|Type|Options|
|------|----|-------|
|category2_id|integer|null: false, foreign_key: true|
|name|integer|null: false|

### Association
- has_many :items
- belongs_to :category2s



* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
