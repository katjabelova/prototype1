# This migration comes from questionnaires (originally 20170208133727)
class AddExplanationLeftAndExplanationRightToScaleQuestions < ActiveRecord::Migration[5.0]
  def change
    reversible do |dir|
      dir.up do
        Questionnaires::ScaleQuestion.add_translation_fields! explanation_left: :string, explanation_right: :string
      end

      dir.down do
        remove_column :questionnaires_scale_question_translations, :explanation_left
        remove_column :questionnaires_scale_question_translations, :explanation_right
      end
    end
  end
end
