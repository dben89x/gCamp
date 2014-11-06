require 'rails_helper'

feature 'signup' do

  scenario 'User signs up' do

    visit main_path
    click_on "Sign Up"
    # save_and_open_page
    fill_in "First name", with: "Doug"
    fill_in "Last name", with: "Bennett"
    fill_in "Email", with: "d@b.com"
    fill_in "Password", with: "1234"
    fill_in "Password confirmation", with: "1234"
    # click_button "Sign up"
    # save_and_open_page

  end

end
