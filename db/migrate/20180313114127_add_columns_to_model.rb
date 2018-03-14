class AddColumnsToModel < ActiveRecord::Migration[5.1]
  def change
    add_reference :models, :model_group, foreign_key: true
  end
end
