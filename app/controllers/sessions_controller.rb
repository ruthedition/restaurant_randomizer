class SessionsController < ApplicationController

  def new
  end 

  def create
    if user = User.find_by(username: params[:username])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to user_path(user) 
      end 
    else  
      flash[:alert] =  "Please try again or Sign Up."
      redirect_to login_path
    end
  end
  
  def omni_create
    if @user = User.find_or_create_by(uid: auth['uid']) do |u|
      u.username = auth['info']['name']
      u.email = auth['info']['email']
      if !u.password 
        u.password = SecureRandom.hex
      end
    end
      session[:user_id] = @user.id
      redirect_to user_path(@user)     
    else 
      redirect_to "/"
    end
  end 

  def destroy
    session[:user_id] = nil 
    redirect_to login_path 
  end 


  private
  
    def auth
      request.env['omniauth.auth']
    end

end 


