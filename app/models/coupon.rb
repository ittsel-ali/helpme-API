class Coupon < ApplicationRecord
  belongs_to :couponable, polymorphic: true
end
