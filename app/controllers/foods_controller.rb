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
    @food = Food.find(params[:id])
    kind = FoodKind.find(@food.kind_id)
    if @food.update_attributes(food_params)
      @food.protein = kind.protein * @food.amount
      @food.lipd = kind.lipd * @food.amount
      @food.carbon = kind.carbon * @food.amount
      @food.vitamin = kind.vitamin * @food.amount
      @food.minerals = kind.minerals * @food.amount
      @food.save
      redirect_to user_foods_path(@food.user_id)
    else
      redirect_to root_url
    end
  end

  def destroy
    @food = Food.find(params[:id]).destroy
    redirect_back(fallback_location: root_url)
  end

  private
    def food_params
      params.require(:food).permit(:foodname, :amount)
    end
end
