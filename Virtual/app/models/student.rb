class Student < ApplicationRecord

  belongs_to :user
  belongs_to :teacher

  validates :teacher_id, presence: true
  validates_associated :vet

end 
