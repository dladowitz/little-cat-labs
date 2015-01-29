class UsersController < ApplicationController
  def new
    @user = User.new

    render layout: "landing_page/landing_layout"
  end

  def create
    @user = User.new user_params

    if @user.save
      flash[:success] = "User account created successfully"
      redirect_to signin_path
    else
      # without specifying layout this was rendering new and then rendering default layout after
      render :new, layout: "landing_page/landing_layout"
    end
  end

  def show
    @page_name = "Homepage"

    @user = User.find_by_id params[:id]

    if @user
      set_cat
      render :show
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def set_cat
    @user.cats.present? ? @cat = @user.cats.first : @cat = Cat.new
  end
end
