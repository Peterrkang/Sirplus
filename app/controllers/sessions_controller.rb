class SessionsController < ApplicationController

  before_action :logged_in_as_correct_user

  def new
  end

  def create
    @provider = Provider.find_by(email: params[:session][:email].downcase)

    if @provider && @provider.authenticate(params[:session][:password])
        log_in @provider
    else
      flash.now[:danger] = 'Wrong email address or password.'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to new_session_path
  end



end
