class Post < ApplicationRecord
  belongs_to :visitor

  has_one :acknowledged_post, dependent: :destroy
  has_one :coupon, as: :couponable, dependent: :destroy
  has_one :image, as: :imagable

  accepts_nested_attributes_for :image
end
