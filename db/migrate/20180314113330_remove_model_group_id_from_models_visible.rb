class RemoveModelGroupIdFromModelsVisible < ActiveRecord::Migration[5.1]
  def change
    remove_column :models_visibles, :model_group_id, :integer
  end
end
