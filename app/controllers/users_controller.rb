class UsersController < ApplicationController
  load_and_authorize_resource

  def new
    render layout: "landing_page/landing_layout"
  end

  def create
    if @user.save
      flash[:success] = "User account created successfully"

      #TODO Mailer should be sent asyncronously. Need to change so not to hold up the controller
      UserMailer.signup_email(@user).deliver

      #should make a login(user) method
      session[:user_id] = @user.id

      redirect_to user_path(@user)
    else
      # without specifying layout this was rendering new and then rendering default layout after
      render :new, layout: "landing_page/landing_layout"
    end
  end

  def show
    @page_name = "My Dashboard"

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
    #TODO move to it's own method or rename
    @weight = Weight.new

    if @user.cats.present?
      @cat = @user.cats.first
      @weights = @cat.weights.order :id

      @graph_points = @cat.graph_points

    else
      @cat = Cat.new
    end
  end
end
