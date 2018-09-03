# This migration comes from questionnaires (originally 20170109125807)
class CreateQuestionnairesMultiScaleSubQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_multi_scale_sub_questions do |t|
      t.integer :rank, null: false, default: 1
      t.references :scale_question, foreign_key: { to_table: :questionnaires_scale_questions}, index: {name: "questionnaires_fk_mssq_sq"}
      t.references :multi_scale_question, foreign_key: { to_table: :questionnaires_multi_scale_questions}, index: {name: "questionnaires_fk_mssq_msq"}

      t.timestamps
    end
    add_index :questionnaires_multi_scale_sub_questions, [:multi_scale_question_id, :rank], unique: true, name: "questionnaires_unique_mssq_msq_rank"
  end
end
