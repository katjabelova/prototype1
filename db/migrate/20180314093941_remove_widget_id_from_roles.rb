class RemoveWidgetIdFromRoles < ActiveRecord::Migration[5.1]
  def change
    remove_column :roles, :widget_id, :integer
  end
end
