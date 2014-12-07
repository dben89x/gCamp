class RenameMembershipRole < ActiveRecord::Migration
  def change
    rename_column :memberships, :role, :role
  end
end
