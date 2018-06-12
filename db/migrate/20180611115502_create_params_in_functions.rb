class CreateParamsInFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :params_in_functions do |t|
      t.references :model_functions, foreign_key: true
      t.references :model_default_params, foreign_key: true

      t.timestamps
    end
  end
end
