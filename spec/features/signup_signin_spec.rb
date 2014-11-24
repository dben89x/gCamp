require 'rails_helper'

feature 'signup' do

  scenario 'User signs up signs out and signs back in and signs out again' do

    visit root_path
    click_on "Sign Up"

    fill_in "First name", with: "Doug"
    fill_in "Last name", with: "Bennett"
    fill_in "Email", with: "d@b.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"

    click_button "Sign Up!"
    expect(page).to have_content("Doug Bennett")

    click_on "Sign Out"
    expect(page).to have_no_content("Doug Bennett")

    click_on "Sign In"

    fill_in "Email", with: "d@b.com"
    fill_in "Password", with: "1234"
    click_on "Sign In!"
    expect(page).to have_content("Doug Bennett")

  end


end
