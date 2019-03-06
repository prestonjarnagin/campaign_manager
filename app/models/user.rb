class User < ApplicationRecord

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, on: :create
  validates_presence_of :first_name
  validates_presence_of :last_name

  has_secure_password
end
