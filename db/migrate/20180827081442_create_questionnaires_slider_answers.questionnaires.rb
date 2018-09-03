# This migration comes from questionnaires (originally 20170327182710)
class CreateQuestionnairesSliderAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_slider_answers do |t|
      t.decimal :value
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_slider_answers, :questionnaires_slider_questions, column: :question_id
    add_foreign_key :questionnaires_slider_answers, :users
  end
end