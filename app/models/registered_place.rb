class RegisteredPlace < ApplicationRecord
  has_one :place, as: :placeable

  has_many :visitors
  has_many :users, through: :visitors
end
