class SendAddress < ApplicationRecord
  belongs_to :user
  #名前用のバリデーション
  VALID_KANJIL_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z]/

  #バリデーション
  validates :kanji_last_name,   presence: true
  validates :kanji_last_name,   format: {with: VALID_KANJIL_REGEX}, allow_blank: true
  validates :kanji_first_name,  presence: true
  validates :kanji_first_name,  format: {with: VALID_KANJIL_REGEX}, allow_blank: true
  validates :kana_last_name,    presence: true
  validates :kana_last_name,    kana: true, allow_blank: true
  validates :kana_first_name,   presence: true
  validates :kana_first_name,   kana: true, allow_blank: true
  validates :post_code,         presence: true
  validates :post_code,         format: {with: /\A\d{3}[-]\d{4}$\z/,message:"のフォーマットが不適切です"}, allow_blank: true
  validates :prefecture_id,     presence: true
  validates :prefecture_id,     format: {with: /\A([1-9]|[1-3][0-9]|4[0-7])\z/,message:"を入力してください"}, allow_blank: true
  validates :city,              presence: true
  validates :address,           presence: true
end
