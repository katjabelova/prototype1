class CreateModelHasOutputSets < ActiveRecord::Migration[5.1]
  def change
    create_table :model_has_output_sets do |t|
      t.references :models, foreign_key: true
      t.references :model_output_sets, foreign_key: true

      t.timestamps
    end
  end
end
