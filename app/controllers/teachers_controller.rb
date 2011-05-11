class TeachersController < ApplicationController

  before_filter :confirm_logged_in_teacher

  layout 'admin'

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def update
    @teacher = Teacher.find(params[:id])
    if @teacher.update_attributes(params[:teacher])
      flash[:notice] = 'Teacher updated.'
      redirect_to(users_path)
    else
      render("edit")
    end
  end

  def show
    @teacher = Teacher.find(params[:id])
  end

end
