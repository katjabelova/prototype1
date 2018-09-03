# This migration comes from questionnaires (originally 20150411083758)
class CreateExperimentChoices < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_experiment_choices do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::ExperimentChoice.create_translation_table! fields: {type: :json, default: [], null: false},
                                                                   name: {type: :string, null: false}
      end

      dir.down do
        Questionnaires::ExperimentChoice.drop_translation_table!
      end
    end
  end
end
