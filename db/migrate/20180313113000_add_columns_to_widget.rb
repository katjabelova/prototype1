class AddColumnsToWidget < ActiveRecord::Migration[5.1]
  def change
    add_reference :widgets, :roles, foreign_key: true
  end
end
