class RemoveRolesIdFromWidget < ActiveRecord::Migration[5.1]
  def change
    remove_column :widgets, :roles_id, :integer
  end
end
