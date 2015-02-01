class WeightsController < ApplicationController
  def create
    @user = User.find_by_id params[:user_id]

    @weight = Weight.new weight_params
    @weight.cat_id = params[:cat_id] #seems like this param should be sent inside of the cat hash, but the form is sending it at the param level

    if @weight.save
      flash[:success] = "New Weight Added"
    else
      flash[:danger] = "Weight Not Added"
    end

    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find_by_id params[:user_id]
    @weight = Weight.find_by_id params[:id]

    if @weight && @weight.delete
      flash[:success] = "Weight Deleted"
    else
      flash[:danger] = "Weight Not Deleted"
    end

    redirect_to user_path(@user)
  end

  #TODO create spec and cucumber test
  def index

    @cat = Cat.find_by_id params[:cat_id]
    @user = User.find_by_id params[:user_id]
    if @cat
      @weights = @cat.weights
    end
  end


  private

  def weight_params
    params.require(:weight).permit(:amount, :cat_id)
  end
end
