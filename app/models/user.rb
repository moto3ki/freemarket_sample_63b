class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable,omniauth_providers:  %i[facebook google_oauth2]

  has_many :items
  has_many :purchases
  # has_many :comments
  has_many :credit_cards
  # has_many :likes
  # has_many :liked_items, through: :likes, source: :item
  # has_many :rates
  # has_many :ratings, through: :rates, source: :rated_user
  has_many :sns_credentials, dependent: :destroy
  has_one :send_address
  has_one :real_address


  #メールアドレス用バリデーション
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  #名前用のバリデーション
  VALID_KANJIL_REGEX = /\A[ぁ-んァ-ン一-龥a-zA-Z]/

  validates :nickname,          presence: true,on: :update
  validates :nickname,          presence: true,on: :member_info_set
  validates :email,             presence: true,on: :member_info_set
  validates :email,             format: { with: VALID_EMAIL_REGEX },uniqueness: true,allow_blank: true,on: :member_info_set
  validates :password,          presence: true,on: :member_info_set
  validates :password,          format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{7,128}+\z/i, message: "英字と数字の両方を含めて設定してください"}, allow_blank: true,on: :member_info_set
  validates :password,          length: { in: 7..128, message: "7文字以上128文字以下で入力してください"}, allow_blank: true,on: :member_info_set
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
  validates :tel_no,            format: {with:/\A\d{11}\z/}, allow_blank: true


  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    if snscredential.present? #sns登録のみ完了してるユーザー
      user = User.find(snscredential.user_id)
      unless user.present? #ユーザーが存在しないなら
        user = set_user(auth)
      end
      sns = snscredential
    else #sns登録 未
      user = User.where(email: auth.info.email).first
      if user.present? #会員登録 済
        user = set_user(auth)
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else #会員登録 未
        user = set_user(auth)
        sns = SnsCredential.create(
          uid: uid,
          provider: provider
        )
      end
    end
    # hashでsnsのidを返り値として保持しておく
    return { user: user , sns_id: sns.id }
  end

  def self.set_user(auth)
    User.new(
      # # snsの情報
      nickname: auth.info.name,
      email: auth.info.email
    )
  end
end
