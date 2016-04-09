class SheltersController < ApplicationController

  before_action :logged_in_as_correct_user, only: [:delete, :update, :edit]

  def show
  end

  def index
  end

  def create
  end

  def delete
  end

  def update
  end

  def edit
  end

  def new
  end
end
