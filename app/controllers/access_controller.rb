class AccessController < ApplicationController
  

  before_filter :confirm_logged_in, :except => [:login, :create, :logout]
  
  def index
    menu
    render('menu')
  end
  
  def menu
    # display text & links
  end

  def login
    # login form
  end
  
  def create
    authorized_user = User.authenticate(params[:email], params[:password])
    if authorized_user
      session[:user_id] = authorized_user.id
      session[:email] = authorized_user.email
      session[:type] = authorized_user.type
      flash[:notice] = "You are now logged in."
      redirect_to(:action => 'index')
    else
      flash[:notice] = "Invalid email/password combination."
      redirect_to(:action => 'login')
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:email] = nil
    session[:type] = nil
    flash[:notice] = "You have been logged out."
    redirect_to(:action => "login")
  end

end
