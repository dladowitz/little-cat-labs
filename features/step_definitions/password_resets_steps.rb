And /the user requests a new password/ do
  visit signin_path
  click_link "Forgot Password"

  fill_in "email", with: @user.email
  click_button "Request New Password"
end
