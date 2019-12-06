class ItemImage < ApplicationRecord
  
  belongs_to :item

  mount_uploader :image, ImageUploader

  validates :image, presence: { message: "がありません" }
end
