require 'rails_helper'

feature 'Projects' do

  scenario 'User creates a project' do

    visit projects_path
    click_on "Create Project"
    fill_in "Name", with: "Something to do"
    click_on "Create Project"
    expect(page).to have_content("Something to do")

    click_on "Edit"
    fill_in "Name", with: "Another thing"
    click_on "Update"
    expect(page).to have_content("Another thing")

    click_on "Destroy"
    expect(page).to have_no_content("Another thing")

  end

end
