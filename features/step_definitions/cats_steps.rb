Then /user adds a cat to her account/ do
  fill_in "cat_name", with: "Aiko"
  fill_in "cat_age", with: "7"

  click_button "Create Cat"
end

Then /user sees cats stats on dashboard/ do
  expect(page).to have_content "Aiko"
  expect(page).to have_content "7"
end


Then /the user updates the cats name/ do
  click_link "Edit Cat"
  fill_in "cat_name", with: "Dusty"
  click_button "Update Cat"
  expect(page).to have_content "Dusty"
end

Then /the user deletes the cat/ do
  click_link "Delete Cat"
  expect(page).to have_content "You don't have any cats yet"
end
