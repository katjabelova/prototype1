class CreateModelHasDefaultParams < ActiveRecord::Migration[5.1]
  def change
    create_table :model_has_default_params do |t|
      t.references :models, foreign_key: true
      t.references :model_default_params, foreign_key: true

      t.timestamps
    end
  end
end
