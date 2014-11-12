require 'rails_helper'

feature 'Users' do

  User.create(
    first_name: 'John',
    last_name: 'Smith',
    email: 'j@s.com',
    password: 'js'
  )

  scenario 'User creates and edits user with wrong and correct info' do
    visit users_path
    click_on "New User"

    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Schmoe"
    fill_in "Email", with: "joe@s.com"
    fill_in "Password", with: "4321"
    fill_in "Password confirmation", with: "4321"
    click_on "Create User"
    expect(page).to have_content("User was successfully created")
    expect(page).to have_content("Joe Schmoe")
    expect(page).to have_content("joe@s.com")

    click_on "Edit", match: :first

    fill_in "First name", with: ""
    fill_in "Last name", with: ""
    fill_in "Email", with: ""
    click_on "Update User"

    expect(page).to have_content("First name can't be blank")
    expect(page).to have_content("Last name can't be blank")
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'User enters duplicate email' do
    visit new_user_path

    fill_in "First name", with: "Joe"
    fill_in "Last name", with: "Schmoe"
    fill_in "Email", with: "j@s.com"
    fill_in "Password", with: "4321"
    fill_in "Password confirmation", with: "4321"
    click_on "Create User"
    expect(page).to have_content("Email has already been taken")
  end

  scenario 'User enters wrong password' do
    visit new_user_path

    fill_in "First name", with: "Jane"
    fill_in "Last name", with: "Plain"
    fill_in "Email", with: "j@p.com"
    fill_in "Password", with: "jp"
    fill_in "Password confirmation", with: "j"
    click_on "Create User"
    expect(page).to have_content("Password confirmation doesn't match Password")

    fill_in "Password", with: "jp"
    fill_in "Password confirmation", with: "jp"
    click_on "Create User"

    expect(page).to have_content("User was successfully created")
  end

  scenario 'User deletes user' do
    visit users_path

    click_on "Edit", match: :first
    click_on "Delete User"
    expect(page).to have_content("User was successfully deleted")
  end

end
