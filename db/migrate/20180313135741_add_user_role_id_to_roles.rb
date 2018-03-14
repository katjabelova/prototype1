class AddUserRoleIdToRoles < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :user_role_id, :integer
  end
end
