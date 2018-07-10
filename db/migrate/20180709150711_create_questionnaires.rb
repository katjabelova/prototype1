class CreateQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionnaires do |t|
      t.text :name
      t.text :question
      t.text :answer_type
      t.text :answer_comment
      t.string :answer_possibilities, array: true, default: []

      t.timestamps
    end
  end
end
