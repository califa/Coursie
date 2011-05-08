class UsersController < ApplicationController

  before_filter :confirm_logged_in
  
  def index
    list
    render('list')
  end
  
  def list
    @users = User.sorted
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User user created.'
      redirect_to(users_path)
    else
      render("new")
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User user updated.'
      redirect_to(users_path)
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User user destroyed."
    redirect_to(users_path)
  end
  
  
end
