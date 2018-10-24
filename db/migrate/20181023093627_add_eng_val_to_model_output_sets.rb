class AddEngValToModelOutputSets < ActiveRecord::Migration[5.1]
  def change
    add_column :model_output_sets, :eng_value, :string
  end
end
