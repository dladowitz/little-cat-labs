class WeightsController < ApplicationController
  def create
    @user = User.find_by_id params[:user_id]

    @weight = Weight.new weight_params
    @weight.cat_id = params[:cat_id] #seems like this param should be sent inside of the cat hash, but the form is sending it at the param level

    @weight.save

    redirect_to user_path(@user)
  end


  private

  def weight_params
    params.require(:weight).permit(:amount, :cat_id)
  end
end
