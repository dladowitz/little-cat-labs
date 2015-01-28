class CatsController < ApplicationController
  def create
    @user = User.find params[:user_id]

    @cat = @user.cats.build cat_params

    # TODO should really render user/show, but getting some error
    if @cat.save
      flash[:success] = "Awesome, lets start tracking #{@cat.name}'s weight' "
      redirect_to user_path @user
    else
      flash[:danger] = "Cat Not Created"
      redirect_to user_path @user
    end
  end

  def edit
    # TODO dry this up
    @user = User.find params[:user_id]
    @cat = Cat.find_by_id params[:id]

    if @cat
      render :edit
    else
      redirect_to user_path(@user)
    end
  end

  def update
    # TODO dry this up

    @user = User.find params[:user_id]
    @cat = Cat.find_by_id params[:id]

    if @cat
      @cat.update_attributes cat_params

      if @cat.save
        redirect_to user_path(@user) and return
      else
        render :edit and return
      end
    end

    redirect_to user_path(@user)
  end


  private

  def cat_params
    params.require(:cat).permit(:name, :age, :user_id)
  end
end
