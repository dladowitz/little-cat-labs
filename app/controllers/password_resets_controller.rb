class PasswordResetsController < ApplicationController
  RESET_LINK = "http://localhost:3000/reset_password/"
  layout "guest_pages/guest_layout"

  def request_password
    @password_reset = PasswordReset.new
  end

  def create
    @user = User.find_by_email params[:email]

    if @user
      password_reset = @user.password_resets.create
      @reset_link = RESET_LINK + password_reset.token.to_s

      render  :email_sent
    else
      flash.now[:danger] = "Email address not found."
      render :request_password
    end
  end
end
