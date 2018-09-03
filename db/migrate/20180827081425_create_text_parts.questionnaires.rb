# This migration comes from questionnaires (originally 20150317200926)
class CreateTextParts < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_text_parts do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::TextPart.create_translation_table! body: {type: :text, null: false}
      end

      dir.down do
        Questionnaires::TextPart.drop_translation_table!
      end
    end
  end
end
