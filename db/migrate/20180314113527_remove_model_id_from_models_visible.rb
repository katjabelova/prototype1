class RemoveModelIdFromModelsVisible < ActiveRecord::Migration[5.1]
  def change
    remove_column :models_visibles, :model_id, :integer
  end
end
