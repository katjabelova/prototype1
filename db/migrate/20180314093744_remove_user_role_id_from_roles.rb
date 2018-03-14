class RemoveUserRoleIdFromRoles < ActiveRecord::Migration[5.1]
  def change
    remove_column :roles, :user_role_id, :integer
  end
end
