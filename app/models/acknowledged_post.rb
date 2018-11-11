class AcknowledgedPost < ApplicationRecord
  belongs_to :post
  belongs_to :visitor

  has_one :coupon, as: :couponable, dependent: :destroy
end
