class RemoveModelIdFromModelGroup < ActiveRecord::Migration[5.1]
  def change
    remove_column :model_groups, :model_id, :integer
  end
end
