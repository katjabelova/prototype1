# This migration comes from questionnaires (originally 20150317200753)
class CreateTextQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_text_questions do |t|
      t.boolean :short, default: false, null: false
      t.string :label, null: false
      t.timestamps
    end
    reversible do |dir|
      dir.up do
        Questionnaires::TextQuestion.create_translation_table! prefix: :string, suffix: :string
      end

      dir.down do
        Questionnaires::TextQuestion.drop_translation_table!
      end
    end
  end
end
