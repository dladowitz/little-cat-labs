class PasswordResetsController < ApplicationController
  def request_password
    @password_reset = PasswordReset.new

    render layout: "landing_page/landing_layout"
  end
end
