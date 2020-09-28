class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
    @appointments = Appointment.by_teacher(@teacher.name) if @teacher
  end
end
