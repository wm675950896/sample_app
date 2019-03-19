class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(:email => params[:session][:email].downcase)
    if !user.empty?
      log_in user
      # params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'sessions/new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end

end
