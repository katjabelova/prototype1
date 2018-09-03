class CreateQuestionnairesQuestionnaires < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_questionnaires do |t|
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::Questionnaire.create_translation_table! title: {type: :string, null: :false}
      end

      dir.down do
        Questionnaires::Questionnaire.drop_translation_table!
      end
    end
  end
end
