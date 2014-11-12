require 'rails_helper'

describe Task do

  it "rejects created due date earlier than today" do
    task = Task.create(
      description: 'do something in the past',
      due_date: '1/1/1999'
    )
    expect(task.errors.present?).to be(true)
  end

end
