class Student < ApplicationRecord

  belongs_to :user
  belongs_to :teacher

  validates :teacher_id, presence: true
  validates_associated :teacher
  accepts_nested_attributes_for :teacher

  def teacher_attributes=(attributes)
    teacher = Teacher.find_or_create_by(attributes)
    self.teacher = teacher
  end  

end
