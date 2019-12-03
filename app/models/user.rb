class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases
  # has_many :comments
  # has_many :credit_cards
  # has_many :likes
  # has_many :liked_items, through: :likes, source: :item
  # has_many :rates
  # has_many :ratings, through: :rates, source: :rated_user
  has_one :send_address
  accepts_nested_attributes_for :send_address
  # has_one :real_address

  #メールアドレス用バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 

  validates :nickname,          presence: true,on: :validates_member_info,on: :update
  validates :email,             presence: true,on: :validates_member_info
  validates :email,             format: { with: VALID_EMAIL_REGEX },uniqueness: true,allow_blank: true,on: :validates_member_info
  validates :password,          presence: true,on: :validates_member_info
  validates :password,          format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i, message: "は英字と数字の両方を含めて設定してください"}, allow_blank: true,on: :validates_member_info
  validates :password,          length: { in: 7..128, message: "は7文字以上128文字以下で入力してください"}, allow_blank: true,on: :validates_member_info
  validates :kanji_last_name,   presence: true,on: :validates_member_info
  validates :kanji_last_name,   format: {with: /\A[ぁ-んァ-ン一-龥]/}, allow_blank: true,on: :validates_member_info
  validates :kanji_first_name,  presence: true,on: :validates_member_info
  validates :kanji_first_name,  format: {with: /\A[ぁ-んァ-ン一-龥]/}, allow_blank: true,on: :validates_member_info
  validates :kana_last_name,    presence: true,on: :validates_member_info
  validates :kana_last_name,    kana: true, allow_blank: true,on: :validates_member_info
  validates :kana_first_name,   presence: true,on: :validates_member_info
  validates :kana_first_name,   kana: true, allow_blank: true,on: :validates_member_info
  validates :birth_day,         presence: true,on: :validates_member_info
  validates :tel_no,            presence: true
  validates :tel_no,            format: {with:/\A\d{10}\z|\A\d{11}\z/}, allow_blank: true
end
