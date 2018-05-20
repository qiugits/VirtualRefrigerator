class FoodsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods.paginate(page: params[:page])
  end

  def new
    @user = User.find(params[:user_id])
    @food = Food.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.build(food_params)
    if @food.save
      redirect_back(fallback_location: root_url)
    else
      render 'food#new'
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private
    def food_params
      params.require(:food).permit(:foodname)
    end
end
