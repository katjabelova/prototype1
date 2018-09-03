# This migration comes from questionnaires (originally 20150317200620)
class CreateTableCells < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_table_cells do |t|
      t.references :table_part, index: true, null: false
      t.integer :row, null: false
      t.integer :col, null: false
      t.references :part, index: true, polymorphic: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_table_cells, :questionnaires_table_parts, column: :table_part_id
  end
end
