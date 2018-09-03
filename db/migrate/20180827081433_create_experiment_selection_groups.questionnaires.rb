# This migration comes from questionnaires (originally 20150423074202)
class CreateExperimentSelectionGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_experiment_selection_groups do |t|
      t.belongs_to :experiment_question, null: false, index: {name: "index_questionnaires_qegs_e_q"}
      t.integer :rank, null: false
      t.timestamps
    end
    add_foreign_key :questionnaires_experiment_selection_groups, :questionnaires_experiment_questions, column: :experiment_question_id
  end
end
