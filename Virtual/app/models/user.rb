class User < ApplicationRecord

  has_many :students
  has_many :appointments

  validates :username, :email, presence: true
  validates :username, :email, uniqueness: true
  has_secure_password

end
