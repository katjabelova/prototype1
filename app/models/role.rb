class Role < ApplicationRecord
  validates :role_name, presence: true, uniqueness:  true

  has_many :users, through: :user_roles
end
