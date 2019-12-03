class RealAddress < ApplicationRecord
  belongs_to :user
  validates :post_code, presence: true,
            format: {with: /\A\d{7}\z/, message: "フォーマットが不適切です"}
end
