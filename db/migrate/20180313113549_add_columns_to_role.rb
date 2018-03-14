class AddColumnsToRole < ActiveRecord::Migration[5.1]
  def change
    add_reference :roles, :widget, foreign_key: true
  end
end
