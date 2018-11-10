class Visitor < ApplicationRecord
  belongs_to :user
  belongs_to :registered_place

  has_many :posts
  has_many :acknowledged_posts
end
