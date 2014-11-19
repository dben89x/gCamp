class ReplaceOwner < ActiveRecord::Migration
  def up
    add_column :memberships, :status, :string
  end

end
