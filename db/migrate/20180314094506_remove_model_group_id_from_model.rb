class RemoveModelGroupIdFromModel < ActiveRecord::Migration[5.1]
  def change
    remove_column :models, :model_group_id, :integer
  end
end
