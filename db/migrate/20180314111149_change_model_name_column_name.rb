class ChangeModelNameColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :models, :model_name, :model_title
  end
end
