class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  #TODO move these out to a module
  rescue_from CanCan::AccessDenied do |exception|
    flash[:danger] = "You are not authorized for this page. All your bases are belong to us."
    binding.pry
    redirect_to user_path(current_user)
  end

  rescue_from ActiveRecord::RecordNotFound do |exception|
    flash[:danger] = "That's not a thing in the database"
    redirect_to user_path(current_user)
  end


  helper_method :current_user  #makes available in view

  def current_user
    User.find session[:user_id] if session[:user_id]
  end
end
