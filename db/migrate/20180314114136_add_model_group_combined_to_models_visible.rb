class AddModelGroupCombinedToModelsVisible < ActiveRecord::Migration[5.1]
  def change
    add_reference :models_visibles, :model_group_consists_of_model, foreign_key: true
  end
end
