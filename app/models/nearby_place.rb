class NearbyPlace < ApplicationRecord
  has_one :place, as: :placeable, validate: false, polymorphic: true
end
