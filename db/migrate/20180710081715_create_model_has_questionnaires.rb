class CreateModelHasQuestionnaires < ActiveRecord::Migration[5.1]
  def change
    create_table :model_has_questionnaires do |t|
      t.references :models, foreign_key: true
      t.references :questionnaires, foreign_key: true

      t.timestamps
    end
  end
end
