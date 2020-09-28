class Appointment < ApplicationRecord

  belongs_to :user

  scope :by_teacher, ->(teacher_name) { where(teacher: teacher_name) }

end
