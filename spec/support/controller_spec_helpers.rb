module ControllerSpecHelpers
  def login_user(account = nil)
    session[:user_id] = ( account || users(:volta)).id
  end

  def logout_user
    session[:user_id] = nil
  end
end
