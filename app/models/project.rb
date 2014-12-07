class ValidateOwnerPresence < ActiveModel::Validator

  def validate(project)
    has_owner = false
    project.memberships.each do |member|
      if member.role == 'owner'
        has_owner = true
        project.errors[:project] << 'Cannot delete the last owner of the project'
      end
    end
  end

end

class Project < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ValidateOwnerPresence
  validates :name, presence: true

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :tasks, dependent: :destroy
end
