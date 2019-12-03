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
  # has_one :real_address

  #メールアドレス用バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  #名前用のバリデーション
  VALID_KANJIL_REGEX = /\A[ぁ-んァ-ン一-龥]/

  validates :nickname,          presence: true
  validates :email,             presence: true,on: :member_info_set
  validates :email,             format: { with: VALID_EMAIL_REGEX },uniqueness: true,allow_blank: true,on: :member_info_set
  validates :password,          presence: true,on: :member_info_set
  validates :password,          format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,100}+\z/i, message: "は英字と数字の両方を含めて設定してください"}, allow_blank: true,on: :member_info_set
  validates :password,          length: { in: 7..128, message: "は7文字以上128文字以下で入力してください"}, allow_blank: true,on: :member_info_set
  validates :kanji_last_name,   presence: true,on: :member_info_set
  validates :kanji_last_name,   format: {with: VALID_KANJIL_REGEX}, allow_blank: true,on: :member_info_set
  validates :kanji_first_name,  presence: true,on: :member_info_set
  validates :kanji_first_name,  format: {with: VALID_KANJIL_REGEX}, allow_blank: true,on: :member_info_set
  validates :kana_last_name,    presence: true,on: :member_info_set
  validates :kana_last_name,    kana: true, allow_blank: true,on: :member_info_set
  validates :kana_first_name,   presence: true,on: :member_info_set
  validates :kana_first_name,   kana: true, allow_blank: true,on: :member_info_set
  validates :birth_day,         presence: true,on: :member_info_set
  validates :tel_no,            presence: true
  validates :tel_no,            format: {with:/\A\d{10}\z|\A\d{11}\z/}, allow_blank: true

end
