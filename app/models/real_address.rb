class RealAddress < ApplicationRecord
  belongs_to :user
  validates :post_code, presence: true
end
