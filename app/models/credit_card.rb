class CreditCard < ApplicationRecord
  belongs_to :user

  validates :credit_card_id, presence: true
end
