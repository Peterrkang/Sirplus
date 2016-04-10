class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email].downcase)

    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to foods_url
    else
      flash.now[:danger] = 'Wrong email address or password.'
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url
  end


  private
  def log_in(user)
    session[:user_id] = user.id
  end


end
