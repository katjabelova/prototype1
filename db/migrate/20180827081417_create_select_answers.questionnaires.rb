# This migration comes from questionnaires (originally 20150317200424)
class CreateSelectAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_select_answers do |t|
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false
      t.string :value
      t.string :other

      t.timestamps
    end
    add_foreign_key :questionnaires_select_answers, :questionnaires_select_questions, column: :question_id
    add_foreign_key :questionnaires_select_answers, :users
  end
end
