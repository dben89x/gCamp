
class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :role, presence: true
  validates_uniqueness_of :user, scope: :project

end
