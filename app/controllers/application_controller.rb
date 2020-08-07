class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_user, :authorized

  def index
    if logged_in?
      redirect_to user_path(current_user)
    else 
      render '/homepage'
    end
  end 


  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
    end 
  end 
    
  def logged_in?
    !!current_user
  end 
    
  def authorize
    if !logged_in?
      redirect_to login_path
    end 
  end 
    
  def authenticate 
    if !current_user
      redirect_to current_user
    end 
  end 
  
end
