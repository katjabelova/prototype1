# This migration comes from questionnaires (originally 20150317230553)
class CreateNumberAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_number_answers do |t|
      t.decimal :value
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_number_answers, :questionnaires_number_questions, column: :question_id
    add_foreign_key :questionnaires_number_answers, :users
  end
end
