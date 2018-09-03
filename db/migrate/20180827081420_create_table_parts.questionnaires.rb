# This migration comes from questionnaires (originally 20150317200619)
class CreateTableParts < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_table_parts do |t|
      t.integer :rows, null: false
      t.integer :cols, null: false

      t.timestamps
    end
  end
end
