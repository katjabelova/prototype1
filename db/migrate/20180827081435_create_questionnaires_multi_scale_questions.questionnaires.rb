# This migration comes from questionnaires (originally 20170109124635)
class CreateQuestionnairesMultiScaleQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_multi_scale_questions do |t|

      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::MultiScaleQuestion.create_translation_table! scales: {type: :string, array: true, default: []},
                                                                     left: :string,
                                                                     right: :string
      end

      dir.down do
        Questionnaires::MultiScaleQuestion.drop_translation_table!
      end
    end
  end
end
