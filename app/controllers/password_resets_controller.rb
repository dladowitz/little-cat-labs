class PasswordResetsController < ApplicationController
  layout "guest_pages/guest_layout"

  def request_password
    @password_reset = PasswordReset.new
  end

  def create
    @user = User.find_by_email params[:email]

    if @user
      password_reset = @user.password_resets.create
      token = password_reset.token

      #TODO Mailer should be sent asyncronously. Need to change so not to hold up the controller
      UserMailer.request_password(@user, token).deliver

      render  :email_sent
    else
      flash.now[:danger] = "Email address not found."
      render :request_password
    end
  end

  def reset_password
    @password_reset = PasswordReset.find_by_token params[:token]
    @user = @password_reset.user

    if @password_reset.used?
      render :already_used and return
    end
  end
end
