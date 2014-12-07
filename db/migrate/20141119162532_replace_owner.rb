class ReplaceOwner < ActiveRecord::Migration
  def up
    add_column :memberships, :role, :string
  end

end
