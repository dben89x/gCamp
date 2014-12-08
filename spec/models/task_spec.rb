require 'rails_helper'

describe Task do
  before :all do
    @project = Project.create!(
      name: 'A project'
    )
  end

  it "rejects created due date earlier than today" do
    task = @project.tasks.create(
      description: 'do something in the past',
      due_date: '1/1/1999'
    )
    expect(task.errors.messages).to eq(:due_date=>["must be after today"])
  end

  it "allows user to update due date earlier than today" do
    task = @project.tasks.create(
      description: 'do something'
    )
    task.update(
      due_date: '1/1/1999'
    )
    expect(task.errors[:due_date].present?).to eq(false)
  end

  it "allows user to enter a blank due date field" do
    task = @project.tasks.create(
      description: 'do something without a due date'
    )
    expect(task.errors[:due_date].present?).to eq(false)
  end

end
