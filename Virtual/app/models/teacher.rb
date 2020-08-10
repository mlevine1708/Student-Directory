class Teacher < ApplicationRecord

  has_many :students
  has_many :users, through: :students
  has_many :appointments


end
