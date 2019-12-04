class RealAddress < ApplicationRecord
  belongs_to :user
  validates :post_code, allow_blank: true,
            format: {with: /\A\d{7}\z/, message: "フォーマットが不適切です"}
end
