Then /they visit the new user page/ do
  visit new_user_path
end


Then /they fill out the new user form/ do
  uri = URI.parse(current_url)
  expect(uri.path).to eq new_user_path

  fill_in "user_first_name",            with: "Andre"
  fill_in "user_email",                 with: "Andre.Ampere@gmail.com"
  fill_in "user_password",              with: "asdfasdf"
  fill_in "user_password_confirmation", with: "asdfasdf"

  click_button "Sign Up"
end

Then /they see the signin page/ do
  uri = URI.parse(current_url)
  expect(uri.path).to eq signin_path
end

And /they see the user homepage/ do
  uri = URI.parse(current_url)
  # expect(uri.path).to eq user_path(current_user) # need access to current_user method

  expect(page).to have_content "Andre"
  expect(page).to have_content "User account created successfully"
end


Then /the user visits his profile page/ do
  click_link "Profile"
  uri = URI.parse(current_url)
  expect(uri.path).to eq user_profile_path(@user)

end

Then /the user changes her name and password/ do
  fill_in "user_first_name",            with: "Miley"
  fill_in "user_password",              with: "new_password"
  fill_in "user_password_confirmation", with: "new_password"
  click_button "Update"

  expect(page).to have_content "Miley"
end

Then /the user logs in with her new password/ do
  fill_in "email",                 with: @user.email
  fill_in "password",              with: "new_password"

  click_button "Sign In"
  expect(page).to have_content "Miley"
end


# testing git

# testing rebasing
# testing rebasing_2

# testing rebasing_3

