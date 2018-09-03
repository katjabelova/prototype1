# This migration comes from questionnaires (originally 20150317200007)
class CreateScaleQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_scale_questions do |t|
      t.string :label, null: false
      t.integer :highlight
      t.timestamps
    end

    reversible do |dir|
      dir.up do
        Questionnaires::ScaleQuestion.create_translation_table! left: :string,
                                                                scales: {type: :string, array: true, default: []},
                                                                right: :string
      end

      dir.down do
        Questionnaires::ScaleQuestion.drop_translation_table!
      end
    end
  end
end
