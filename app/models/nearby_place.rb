class NearbyPlace < ApplicationRecord
  has_one :place, as: :placeable, validate: false
end
