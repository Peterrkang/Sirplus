class SessionsController < ApplicationController

  # before_action :logged_in_as_correct_user

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to root_url
    else
      flash.now[:danger] = 'Wrong email address or password.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to new_session_path
  end


  private
  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end

end
