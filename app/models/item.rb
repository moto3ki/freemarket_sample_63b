class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :user
  has_many :item_images, dependent: :destroy
  has_one  :purchase, dependent: :destroy
  belongs_to_active_hash :prefecture
  # belongs_to :category

  # accepts_nested_attributes_for :item_images

  NOT_NULL_MESSAGE   = "入力してください"
  NOT_SELECT_MESSAGE = "選択してください"
  validates :name,       presence: { message: NOT_NULL_MESSAGE }
  validates :name,       length: { maximum: 40, message: "40 文字以下で入力してください" }, allow_blank: true
  validates :explain,    presence: { message: NOT_NULL_MESSAGE }
  validates :explain,    length: { maximum: 1000, message: "1000 文字以下で入力してください" }, allow_blank: true
  validates :condition, 
    inclusion: {in: ["新品、未使用",
                     "未使用に近い",
                     "目立った傷や汚れなし",
                     "やや傷や汚れあり",
                     "傷や汚れあり",
                     "全体的に状態が悪い"],
                message: NOT_SELECT_MESSAGE
               }
  validates :delivery_charge,
    inclusion: {in: ["送料込み(出品者負担)",
                     "着払い(購入者負担)"],
                message: NOT_SELECT_MESSAGE
               }
  validates :delivery_method,
    inclusion: {in: ["未定",
                     "らくらくメルカリ便",
                     "ゆうメール",
                     "レターパック",
                     "普通郵便(定形、定形外)",
                     "クロネコヤマト",
                     "ゆうパック",
                     "クリックポスト",
                     "ゆうパケット"],
                message: NOT_SELECT_MESSAGE
               }
  validates :prefecture_id, 
    numericality: {greater_than_or_equal_to: 1,
                   less_than_or_equal_to:    47,
                   message: NOT_SELECT_MESSAGE
                  }
  validates :delivery_period,
    inclusion: {in: ["1~2日で発送",
                     "2~3日で発送",
                     "4~7日で発送"],
                message: NOT_SELECT_MESSAGE
               }
  validates :price,
    numericality: {greater_than_or_equal_to: 300,
                   less_than_or_equal_to:    9999999,
                   message: "300以上9999999以下で入力してください"
                  }
                  
  enum condition: {
    "---":              0,
    "新品、未使用":       1,
    "未使用に近い":       2,
    "目立った傷や汚れなし": 3,
    "やや傷や汚れあり":    4,
    "傷や汚れあり":       5,
    "全体的に状態が悪い":  6
  }, _prefix: true

  enum delivery_charge: {
    "---":               0,
    "送料込み(出品者負担)": 1,
    "着払い(購入者負担)":   2
  }, _prefix: true

  enum delivery_method: {
    "---":                 0,
    "未定":                 1,
    "らくらくメルカリ便":     2,
    "ゆうメール":            3,
    "レターパック":          4,
    "普通郵便(定形、定形外)": 5,
    "クロネコヤマト":        6,
    "ゆうパック":           7,
    "クリックポスト":        8,
    "ゆうパケット":          9,
  }, _prefix: true

  enum delivery_period: {
    "---":       0,
    "1~2日で発送": 1,
    "2~3日で発送": 2,
    "4~7日で発送": 3
  }, _prefix: true

end
