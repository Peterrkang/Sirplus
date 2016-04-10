class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
  end

  def index
  end

  def new
    @food = Food.new()
  end

  def create
    food = Food.create(food_params)
    food.update(expiration_time: Food.get_expiration_time(params[:hours], params[:minutes]))
    coordinates = food.get_coordinates
    food.update(longitude: coordinates[0], latitude: coordinates[1])
    redirect_to foods_path
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end

  private

  def food_params
    params.require(:food).permit(:title, :description, :address)
  end

end
