class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :user_locations
  has_many :visitors
  has_many :registered_places, through: :visitors

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable



  class << self
    def authenticate(email, password)
      user = User.find_for_database_authentication(:email => email)

      if user&.valid_for_authentication? { user.valid_password?(password) } && user&.active_for_authentication?
        user
      end
     end
  end
end
