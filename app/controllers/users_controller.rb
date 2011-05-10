class UsersController < ApplicationController

  before_filter :confirm_logged_in_admin

  layout 'admin'
  
  def index
    list
    render('list')
  end
  
  def list
    @users = User.sorted_by_type
  end

  def new
    @user = User.new
#    @possible_classes = User.child_classes
  end

#  def new_admin
#    @user = Admin.new
#  end
#
#  def new_teacher
#    @user = Teacher.new
#  end
#
#  def new_student
#    @user = Student.new
#  end

  def create

    @user = User.new(params[:user])
    @user.type = params[:user].delete(:type)
    if @user.save
      flash[:notice] = "#{params[:type]} user created."
      redirect_to(users_path)
    else
#      @possible_classes = User.child_classes
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User updated.'
      redirect_to(users_path)
    else
#      @possible_classes = User.child_classes
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User destroyed."
    redirect_to(users_path)
  end
  
  
end
