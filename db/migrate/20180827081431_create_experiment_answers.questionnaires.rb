# This migration comes from questionnaires (originally 20150411083846)
class CreateExperimentAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_experiment_answers do |t|
      t.belongs_to :user, index: true, null: false
      t.belongs_to :question, index: true, null: false
      t.belongs_to :experiment_choice, index: true

      t.timestamps
    end
    add_foreign_key :questionnaires_experiment_answers, :users
    add_foreign_key :questionnaires_experiment_answers, :questionnaires_experiment_questions, column: :question_id
    add_foreign_key :questionnaires_experiment_answers, :questionnaires_experiment_choices, column: :experiment_choice_id
  end
end
