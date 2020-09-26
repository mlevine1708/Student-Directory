class Teacher < ApplicationRecord

  has_many :students
  has_many :users, through: :students
  has_many :appointments

  def ordered_students
    students.order_by_grade
  end

end
