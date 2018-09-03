# This migration comes from questionnaires (originally 20150317200020)
class CreateScaleAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_scale_answers do |t|
      t.integer :value
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_scale_answers, :questionnaires_scale_questions, column: :question_id
    add_foreign_key :questionnaires_scale_answers, :users
  end
end
