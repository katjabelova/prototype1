# This migration comes from questionnaires (originally 20150317200944)
class CreateModals < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_modals do |t|
      t.references :text_part, index: true, null: false
      t.string :href_id, null: false
      t.timestamps
    end
    add_foreign_key :questionnaires_modals, :questionnaires_text_parts, column: :text_part_id

    reversible do |dir|
      dir.up do
        Questionnaires::Modal.create_translation_table! body: {type: :text, null: false}, header: {type: :string, null: false}
      end

      dir.down do
        Questionnaires::Modal.drop_translation_table!
      end
    end
  end
end
