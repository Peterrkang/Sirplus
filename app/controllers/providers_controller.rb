class ProvidersController < ApplicationController

  before_action :logged_in_as_correct_user, only: [:delete, :update, :edit]

  def new
    @provider = Provider.new
  end

  def create
    @provider = Provider.new(provider_params)
    if @provider
      flash[:created] = "Sign up successfully!!!!"
      @provider.save
      redirect_to root_url
    else
      flash[:error] = @provider.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def delete
  end

  private
  def provider_params
    params.require(:provider).permit(:email, :password, :password_confirmation)
  end

end
