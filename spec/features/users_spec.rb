require 'rails_helper'

feature 'Users' do

  scenario 'User creates, edits, and deletes user' do

    visit users_path
    click_on "New User"

    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Schmoe"
    fill_in "Email", with: "j@s.com"
    fill_in "Password", with: "4321"
    fill_in "Password confirmation", with: "4321"
    click_on "Create User"
    expect(page).to have_content("User was successfully created")

    click_on "Edit"

    fill_in "First name", with: ""
    click_on "Update User"
    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Password can't be blank")

    fill_in "Last name", with: ""
    click_on "Update User"
    expect(page).to have_content("Last name can't be blank")

    fill_in "Email", with: ""
    click_on "Update User"
    expect(page).to have_content("Email can't be blank")

    fill_in "First name", with: "Jane"
    fill_in "Last name", with: "Plain"
    fill_in "Email", with: "j@p.com"
    fill_in "Password", with: "jp"
    fill_in "Password confirmation", with: "j"
    click_on "Update User"
    expect(page).to have_content("Password confirmation doesn't match Password")

    fill_in "Password", with: "jp"
    fill_in "Password confirmation", with: "jp"
    click_on "Update User"

    expect(page).to have_content("User was successfully updated")

    click_on "Edit"
    click_on "Delete User"
    expect(page).to have_content("User was successfully deleted")

  end

end
