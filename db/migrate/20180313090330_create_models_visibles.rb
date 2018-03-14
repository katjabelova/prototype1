class CreateModelsVisibles < ActiveRecord::Migration[5.1]
  def change
    create_table :models_visibles do |t|
      t.references :role, foreign_key: true
      t.references :model_group, foreign_key: true
      t.references :model, foreign_key: true

      t.timestamps
    end
  end
end
