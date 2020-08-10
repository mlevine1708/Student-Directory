class AppointmentsController < ApplicationController
  before_action :check_for_logged_in, only: [:new, :create, :edit, :update]

  def index
    @teacher = Teacher.find_by_id(params[:teacher_id])
    if @teacher
      @appointments = @teacher.appointments
    else
      redirect_to teachers_path
    end
  end

  def new
    @teacher = Teacher.find_by_id(params[:teacher_id])

    @appointment = @teacher.appointments.build
  end


  #unnested
  def create
    @teacher = Teacher.find_by_id(params[:teacher_id])
    @appointment = current_user.appointments.build(appointment_params)
    @appointment.teacher = @teacher
    if @appointment.save
      redirect_to teacher_path(@appointment.teacher)
    else

      render :new
    end
  end

  private
    def appointment_params
      params.require(:appointment).permit(:teacher, :student, :date)
    end
end
