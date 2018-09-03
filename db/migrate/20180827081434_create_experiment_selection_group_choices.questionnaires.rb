# This migration comes from questionnaires (originally 20150423074223)
class CreateExperimentSelectionGroupChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_experiment_selection_group_choices do |t|
      t.belongs_to :experiment_choice, null: false, index: {name: "index_questionnaires_qesgcs_e_c"}
      t.belongs_to :experiment_selection_group, null: false, index: {name: "index_questionnaires_qesgcs_e_s_q"}
      t.integer :rank, null: false
      t.timestamps
    end
    add_foreign_key :questionnaires_experiment_selection_group_choices, :questionnaires_experiment_choices, column: :experiment_choice_id
    add_foreign_key :questionnaires_experiment_selection_group_choices, :questionnaires_experiment_selection_groups, column: :experiment_selection_group_id
  end
end
