class SheltersController < ApplicationController

  before_action :logged_in_as_correct_user, only: [:delete, :update, :edit]

  def new
    @shelter = Shelter.new
  end

  def create
    @shelter = Shelter.new(provider_params)
    if @shelter
      flash[:created] = "Sign up successfully!!!!"
      @shelter.save
      redirect_to root_url
    else
      flash[:error] = @shelter.errors.full_messages
      render 'new'
    end
  end

  def show
  end

  def index
  end


  def delete
  end

  def update
  end

  def edit
  end

  private

end
