class UserMailer < ApplicationMailer
  def registration_email(registration)
    @registration = registration
    attachments.inline['logo_handwriting.png'] = File.read('app/assets/images/logo_handwriting.png')

    mail(to: @registration.email, subject: "Little Cat Labs - Registration")
  end

  def signup_email(user)
    @user = user
    attachments.inline['logo_handwriting.png'] = File.read('app/assets/images/logo_handwriting.png')

    mail(to: @user.email, subject: "Little Cat Labs - Signup")
  end
end
