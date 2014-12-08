class Task < ActiveRecord::Base
  validate :due_date_cannot_be_in_the_past, on: :create

  def due_date_cannot_be_in_the_past
    if due_date != nil && due_date < Date.today
      errors.add(:due_date, 'must be after today')
    end
  end

  belongs_to :project
  has_many :comments, dependent: :destroy

  validates :description, presence: true

end
