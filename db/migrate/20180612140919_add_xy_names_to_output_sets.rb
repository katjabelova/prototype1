class AddXyNamesToOutputSets < ActiveRecord::Migration[5.1]
  def change
    add_column :model_output_sets, :xname, :string
    add_column :model_output_sets, :yname, :string
  end
end
