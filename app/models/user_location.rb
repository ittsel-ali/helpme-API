class UserLocation < ApplicationRecord
has_many :visitors
belongs_to :user
end
