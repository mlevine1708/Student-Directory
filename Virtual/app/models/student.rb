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

  def self.search_by_grade(grade)
    Student.where("grade > ?", grade)
  end

  def self.order_by_grade
  end

end
