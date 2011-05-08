class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def confirm_logged_in(type=["Admin", "Teacher", "Student"])
    unless session[:user_id]
      flash[:notice] = "Please log in."
      redirect_to(:controller => 'access', :action => 'login')
      return false # halts the before_filter
    else
      if type.include?(session[:type])
        return true
      else
        if session[:type] == "Student"
          redirect_to(:controller => 'access', :action => 'login') #PLACE HOLDER
        end
        if session[:type] == "Teacher"
          redirect_to(:controller => 'access', :action => 'menu')
        end
        if session[:type] == "Admin"
          redirect_to(:controller => 'access', :action => 'menu')
        end
      end
    end
  end
end
