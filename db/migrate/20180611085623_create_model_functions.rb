class CreateModelFunctions < ActiveRecord::Migration[5.1]
  def change
    create_table :model_functions do |t|
      t.string :name
      t.string :path, unique: true

      t.timestamps
    end
  end
end
