class CreateModelGroupConsistsOfModels < ActiveRecord::Migration[5.1]
  def change
    create_table :model_group_consists_of_models do |t|
      t.references :model_group, foreign_key: true
      t.references :model, foreign_key: true

      t.timestamps
    end
  end
end
