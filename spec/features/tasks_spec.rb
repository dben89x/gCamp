require 'rails_helper'

feature 'Tasks' do

  scenario 'User creates and edits an event task' do
    visit projects_path
    click_on "Create Task"

    fill_in "Description", with: "A description"
    fill_in "Due date", with: "25/4/2020"
    click_on "Create Task"
    expect(page).to have_content("A description")
    expect(page).to have_content("4/25/2020")

    click_on "Edit"
    fill_in "Description", with: "Another description"
    fill_in "Due date", with: "26/4/2021"
    check "Complete"
    click_on "Update"
    expect(page).to have_content("Another description")

    click_on "Back"
    expect(page).to have_no_content("Another description")

    click_on "All"
    expect(page).to have_content("Another description")
    expect(page).to have_content("4/26/2021")

    click_on "Show"
    expect(page).to have_content("Another description")
  end

  scenario 'User enters invalid fields, then destroys task' do
    visit new_task_path

    fill_in "Description", with: ""
    fill_in "Due date", with: ""
    click_on "Create"
    expect(page).to have_content("Description can't be blank")
    expect(page).to have_content("Due date can't be blank")

    fill_in "Due date", with: "1/1/1990"
    click_on "Create"
    expect(page).to have_content("Task due date must be after today")

    fill_in "Description", with: "Another description"
    fill_in "Due date", with: "26/4/2021"
    click_on "Create"
    click_on "Back"

    expect(page).to have_content("Another description")
    expect(page).to have_content("4/26/2021")

    click_on "Destroy"
    expect(page).to have_no_content("Another description")
  end

end
