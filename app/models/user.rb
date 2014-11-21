class User < ActiveRecord::Base
  def full_name
    "#{first_name} #{last_name}"
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :memberships
  has_many :comments
  has_many :owners, through: :memberships
  has_many :projects, through: :memberships

  has_secure_password
end
