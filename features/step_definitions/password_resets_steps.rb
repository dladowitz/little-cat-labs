And /the user requests a new password/ do
  visit signin_path
  click_link "Forgot Password"

  fill_in "email", with: @user.email
  click_button "Request New Password"
end

And /the user resets the password/ do
  token = @user.password_resets.last.token
  reset_link = "http://localhost:3000/reset_password/#{token}"

  visit reset_link
  fill_in "user_password",              with: "new_password"
  fill_in "user_password_confirmation", with: "new_password"
  click_button "Update User"

  expect(page).to have_content "Password updated"
  click_button "Sign In"
end
