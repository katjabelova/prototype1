# This migration comes from questionnaires (originally 20150317200852)
class CreateNumberQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_number_questions do |t|
      t.string :label, null: false
      t.decimal :min, null: false
      t.decimal :max, null: false
      t.decimal :step, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::NumberQuestion.create_translation_table! prefix: :string, suffix: :string
      end

      dir.down do
        Questionnaires::NumberQuestion.drop_translation_table!
      end
    end
  end
end
