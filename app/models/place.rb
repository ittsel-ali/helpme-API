class Place < ApplicationRecord
  belongs_to :placeable, polymorphic: true
end
