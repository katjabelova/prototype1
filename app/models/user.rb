class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }
  has_many :user_roles
  has_many :roles, through: :user_roles

  validates :email, presence: true, email: true, uniqueness: true, length: { maximum: 255 }
  validates :password, presence: true, length: { maximum: 50 }
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }

end
