class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
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
