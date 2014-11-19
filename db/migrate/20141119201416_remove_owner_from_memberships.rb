class RemoveOwnerFromMemberships < ActiveRecord::Migration
  def change
    remove_column :memberships, :owner?
  end
end
