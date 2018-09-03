# This migration comes from questionnaires (originally 20150317200617)
class CreateDistributionSubQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_distribution_sub_questions do |t|
      t.string :label, null: false
      t.integer :rank, null: false
      t.references :distribution_question, index: {name: "questionnaires_distribution_sub_questions_dq_idx"}

      t.timestamps
    end
    add_foreign_key :questionnaires_distribution_sub_questions, :questionnaires_distribution_questions, column: :distribution_question_id
    reversible do |dir|
      dir.up do
        Questionnaires::DistributionSubQuestion.create_translation_table! question: {type: :string, null: :false},
                                                                          hint: {type: :string}
      end

      dir.down do
        Questionnaires::DistributionSubQuestion.drop_translation_table!
      end
    end

  end
end