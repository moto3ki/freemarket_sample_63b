class RealAddress < ApplicationRecord
  belongs_to :user
  # 郵便番号のバリデーション
  validates :post_code, allow_blank: true,
            format: {with: /\A\d{7}\z/, message: "フォーマットが不適切です"}
end
