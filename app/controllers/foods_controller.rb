class FoodsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @foods = @user.foods.all
  end

  def search
    @kinds = FoodKind.where('kindname LIKE(?) ', "%#{params[:keyword]}%").limit(20)
    #respond_to do |format|
    #  format.json { render 'index', json: @users }
    #end
    render json: @kinds
  end

  def new
    @user = User.find(params[:user_id])
    @food = Food.new
  end

  def create
    @user = User.find(params[:user_id])
    @food = @user.foods.build(food_params)
    if @food.save
      redirect_to user_foods_path(@user)
    else
      redirect_back(fallback_location: user_foods_path(@user))
    end
  end

  def edit
    @food = Food.find(params[:id])
    @user = User.find(@food.user_id)
  end

  def update
    @food = Food.find(params[:id])
    if @food.update_attributes(food_params)
      redirect_to user_foods_path(@food.user_id)
    else
      redirect_to root_url
    end
  end

  def destroy
    @food = Food.find(params[:id]).destroy
    #redirect_back(fallback_location: root_url)
    redirect_to user_foods_path(@food.user_id)
  end

  private
    def food_params
      params.require(:food).permit(:foodname, :kind_id, :amount)
    end
end
