Then /the user adds a weight in decimal to her cats account/ do
  fill_in "weight_amount", with: 12
  click_button "Add Weight"
  expect(page).to have_content "12.00 lbs"
end

Then /the user adds a weight in pounds and ounces to her cats account/ do
  choose("Pounds and Ounces")
  fill_in "weight_amount_pounds", with: 12
  fill_in "wieght_amound_ounces", with: 4
  click_button "Add Weight"
  expect(page).to have_content "12.25 lbs"
end

Then /the user deletes a weight from her cats account/ do
  expect(page).to have_content "12.00 lbs"

  click_link "x"
  expect(page).not_to have_content "12.00 lbs"
end
