class FoodsController < ApplicationController
  def show
    @food = Food.find(params[:id])
  end

  def index
    if request.xhr?
      # if user is shelter then all render. This might not be working
      food_hash = []
      Food.all.each_with_index do |food, i|
        food_hash[i] = {
          :"title" => food.title,
          :"description" => food.description,
          :"address" => food.address,
          :"latitude" => food.latitude,
          :"longitude" => food.longitude,
          :"expiration_time" => food.expiration_time
        }
      end
      render json: food_hash
    else
    end
  end

  def new
    @food = Food.new()
  end

  def create
    food = Food.create(food_params)
    food.update(expiration_time: Food.get_expiration_time(params[:hours], params[:minutes]))
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
