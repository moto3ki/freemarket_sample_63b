class Item < ApplicationRecord

  belongs_to :user
  has_many :item_images, dependent: :destroy
  has_one  :purchase, dependent: :destroy

  validates :name, presence: true
  
end
