# This migration comes from questionnaires (originally 20150317200627)
class CreateDistributionSubAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_distribution_sub_answers do |t|
      t.decimal :value
      t.references :question, index: true, null: false
      t.references :user, index: true, null: false

      t.timestamps
    end
    add_foreign_key :questionnaires_distribution_sub_answers, :questionnaires_distribution_sub_questions, column: :question_id
    add_foreign_key :questionnaires_distribution_sub_answers, :users
  end
end
