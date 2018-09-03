# This migration comes from questionnaires (originally 20150317200307)
class CreateSelectQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_select_questions do |t|
      t.string :label, null: false
      t.integer :display_mode, default: 0, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::SelectQuestion.create_translation_table! other: :string,
                                                                 choices: {type: :string, array: :true, default: []}
      end

      dir.down do
        Questionnaires::SelectQuestion.drop_translation_table!
      end
    end
  end
end
