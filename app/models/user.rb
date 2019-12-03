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
  accepts_nested_attributes_for :send_address

  validates :nickname, presence: true
end
