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
  has_one :real_address


  #メールアドレス用バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  #名前用のバリデーション
  VALID_KANJIL_REGEX = /\A[ぁ-んァ-ン一-龥]/

  validates :nickname,          presence: true
  validates :email,             presence: true
  validates :email,             format: { with: VALID_EMAIL_REGEX },uniqueness: true,allow_blank: true
  validates :password,          presence: true
  validates :password,          format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "は英字と数字の両方を含めて設定してください"}, allow_blank: true
  validates :kanji_last_name,   presence: true
  validates :kanji_last_name,   format: {with: /\A[ぁ-んァ-ン一-龥]/}, allow_blank: true
  validates :kanji_first_name,  presence: true
  validates :kanji_first_name,  format: {with: /\A[ぁ-んァ-ン一-龥]/}, allow_blank: true
  validates :kana_last_name,    presence: true
  validates :kana_last_name,    kana: true, allow_blank: true
  validates :kana_first_name,   presence: true
  validates :kana_first_name,   kana: true, allow_blank: true
  validates :birth_day,         presence: true
  validates :tel_no,            presence: true
  validates :tel_no,            format: {with:/\A\d{10}\z|\A\d{11}\z/}, allow_blank: true
end
