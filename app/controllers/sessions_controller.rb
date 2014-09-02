class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
      
    if user
      log_in(user)
      redirect_to goals_url
    else
      flash.now[:errors] = ["Invalid username or password."]
      render :new
    end
  end

  def new
    
  end

  def destroy
    log_out
    redirect_to new_session_url
  end
end
