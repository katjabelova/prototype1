class AddColumnsToModelGroup < ActiveRecord::Migration[5.1]
  def change
    add_reference :model_groups, :model, foreign_key: true
  end
end
