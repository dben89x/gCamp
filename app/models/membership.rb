class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :status, presence: true
  validates_uniqueness_of :user

end
