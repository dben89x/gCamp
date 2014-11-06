require 'rails_helper'

feature 'Tasks' do

  scenario 'User creates and edits an event task' do

    visit tasks_path
    click_on "Create Task"
    fill_in "Description", with: "A description"
    fill_in "Due date", with: "25/4/2014"
    click_on "Create Task"

    click_on "Edit"
    fill_in "Description", with: "Another description"
    fill_in "Due date", with: "26/4/2014"
    check "Complete"
    click_on "Update"

    click_on "Edit"
    check "Complete"
    click_on "Update"
    # click_on "Back"
    # click_on "show"
    # expect(page).to have_content("Another description")
    # expect(page).to have_content("4/26/2014")
  end

end
