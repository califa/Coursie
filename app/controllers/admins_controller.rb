class AdminsController < ApplicationController

  before_filter :confirm_logged_in_admin

  layout 'admin'

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if @admin.update_attributes(params[:user])
      flash[:notice] = 'Admin updated.'
      redirect_to(users_path)
    else
      render("edit")
    end
  end


end
