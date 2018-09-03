# This migration comes from questionnaires (originally 20150317140717)
class CreateGroupParts < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_group_parts do |t|
      t.integer :rank, null: false
      t.boolean :disabled, default: false, null: false
      t.references :group, index: true, null: false
      t.references :part, polymorphic: true, index: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_group_parts, :questionnaires_groups, column: :group_id
  end
end
