class Membership < ActiveRecord::Base

  def validate_owner_presence
    
  end

  validate :validate_owner_presence, on: :destroy

  belongs_to :user
  belongs_to :project

  validates :user_id, presence: true
  validates :role, presence: true
  validates_uniqueness_of :user, scope: :project

end
