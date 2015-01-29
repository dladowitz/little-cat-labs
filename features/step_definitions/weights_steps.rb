Then /the user adds a weight to her cats account/ do
  fill_in "weight_amount", with: 12
  click_button "Add Weight"
  expect(page).to have_content "12.0 lbs"
end

Then /the user deletes a weight from her cats account/ do
  expect(page).to have_content "12.0 lbs"

  click_button "Delete Weight"
  expect(page).not_to have_content "12.0 lbs"
end
