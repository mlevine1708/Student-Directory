class Appointment < ApplicationRecord

  belongs_to :user
  belongs_to :teacher
  belongs_to :student 

end
