# This migration comes from questionnaires (originally 20170327182218)
class CreateQuestionnairesSliderQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_slider_questions do |t|
      t.integer :min, default: 0, null: false
      t.integer :max, default: 100, null: false
      t.integer :steps, default: 50, null: false
      t.string :label, null: false
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::SliderQuestion.create_translation_table! hints: {type: :json, default: {}},
                                                                 left: :string,
                                                                 right: :string
      end

      dir.down do
        Questionnaires::SliderQuestion.drop_translation_table!
      end
    end

  end
end
