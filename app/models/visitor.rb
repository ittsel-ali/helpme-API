class Visitor < ApplicationRecord
  belongs_to :user_location
  belongs_to :registered_place

  has_many :posts
  has_many :acknowledged_posts

  accepts_nested_attributes_for :user_location
end
