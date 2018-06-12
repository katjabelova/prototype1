class ChangeUniqueValueInModelFunctions < ActiveRecord::Migration[5.1]
  def change
    remove_column :model_functions, :path, :string
    add_column :model_functions, :path, :string
  end
end
