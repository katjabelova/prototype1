# This migration comes from questionnaires (originally 20150411084203)
class CreateExperimentSelections < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_experiment_selections do |t|
      t.belongs_to :experiment_question, index: {name: "index_questionnaires_qes_e_q"}, null: false
      t.belongs_to :experiment_choice, index: {name: "index_questionnaires_qes_e_c"}, null: false
      t.belongs_to :user, index: true, null: false
      t.integer :rank, null: false
      t.timestamps
    end
    add_foreign_key :questionnaires_experiment_selections, :questionnaires_experiment_questions, column: :experiment_question_id
    add_foreign_key :questionnaires_experiment_selections, :questionnaires_experiment_choices, column: :experiment_choice_id
    add_foreign_key :questionnaires_experiment_selections, :users
  end
end
