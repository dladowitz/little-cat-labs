class RegistrationsController < ApplicationController
  before_action :load_registration, only: [:new, :create]

  def new
    render layout: "guest_pages/guest_layout"
  end

  def create
    if @registration.save

      #TODO Mailer should be sent asyncronously. Need to change so not to hold up the controller
      UserMailer.registration_email(@registration).deliver

      redirect_to confirmation_registrations_path
    else
      render :new
    end
  end

  def confirmation
    render layout: "guest_pages/guest_layout"
  end

  private

  def registration_params
    params.require(:registration).permit(:email)
  end

  def load_registration
    if params[:registration]
      @registration = Registration.new registration_params
    else
      @registration = Registration.new
    end
  end
end
