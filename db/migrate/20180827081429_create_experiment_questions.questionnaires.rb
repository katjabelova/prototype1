# This migration comes from questionnaires (originally 20150411083655)
class CreateExperimentQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_experiment_questions do |t|
      t.string :label, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::ExperimentQuestion.create_translation_table! fields: {type: :json, default: [], null: false},
                                                                     select: {type: :string, null: false}
      end

      dir.down do
        Questionnaires::ExperimentQuestion.drop_translation_table!
      end
    end
  end
end
