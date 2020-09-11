class StudentsController < ApplicationController
  before_action :check_for_logged_in, except: [:index]

  def new
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      @student = teacher.students.build
    else
      @student = Student.new
      @student.build_teacher  #belongs_to
    end
  end


  def create
    @student = current_user.students.build(student_params)
    if @student.save
      redirect_to student_path(@student)
    else
      @student.build_teacher unless @student.teacher
      render :new
    end
  end

  def index
    if params[:teacher_id] && teacher = Teacher.find_by_id(params[:teacher_id])
      #nested route
      @students = teacher.students
    else
       if params[:grade]
          @students = Student.search_by_grade(params[:grade])
          #redirect or render 
        #  @students = Student.order_by_grade if @students == []
        else
          @students = Student.includes(:teacher,:user)
        end
    end
  end

  def show
    set_student
  end

  def edit
    set_student
  end

  def update
    set_student
    if @student.update(student_params)
      redirect_to student_path(@student)
    else
      render :edit
    end
  end

  def destroy
    set_student
    @student.destroy
    redirect_to students_path
  end

  private

  def set_student
    @student = Student.find_by(id: params[:id])
    if !@student
      redirect_to students_path
    end
  end

  def student_params
    params.require(:student).permit(:grade, :name, :parent, :teacher_id, teacher_attributes: [:name, :grade])
  end
end
