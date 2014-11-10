class ValidateDueDate < ActiveModel::Validator

  def validate(task)
    if task.due_date != nil && task.due_date < Date.today
      task.errors[:task] << 'due date must be after today'
    end
  end

end

class Task < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ValidateDueDate
  validates :description, presence: true
  validates :due_date, presence: true

end
