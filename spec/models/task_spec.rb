require 'rails_helper'

describe Task do
  before :all do
    @project = create_project
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

  it 'deletes all comments associated with the task' do
    user = create_user
    task = create_task(project: @project)
    comment = create_comment(user: user, task: task)
    Task.delete_all
    p task.id
    expect(task).to eq(nil)
    expect(comment).to eq(nil)
  end
end
