# This migration comes from questionnaires (originally 20150317230516)
class CreateTextAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_text_answers do |t|
      t.string :value
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_text_answers, :questionnaires_text_questions, column: :question_id
    add_foreign_key :questionnaires_text_answers, :users
  end
end
