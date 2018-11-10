class Post < ApplicationRecord
  belongs_to :visitor

  has_one :acknowledged_post, dependant: :destroy
  has_one :coupon, as: :couponable, dependant: :destroy
end
