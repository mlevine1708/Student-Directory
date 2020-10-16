class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
    @teachers = Teacher.search(params[:search])
  end

  def show
    @teacher = Teacher.find_by(id: params[:id])
  end



end
