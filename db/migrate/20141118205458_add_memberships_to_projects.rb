class AddMembershipsToProjects < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.boolean :owner?
      t.belongs_to :user
      t.belongs_to :project
      t.timestamps
    end
  end
end
