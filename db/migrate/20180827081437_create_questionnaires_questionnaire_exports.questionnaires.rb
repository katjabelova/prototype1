# This migration comes from questionnaires (originally 20170125145836)
class CreateQuestionnairesQuestionnaireExports < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_questionnaire_exports do |t|
      t.integer :format, null: false, default: 0
      t.integer :status, null: false, default: 0
      t.string :result
      t.references :questionnaire, foreign_key: {to_table: :questionnaires_questionnaires}, null: false

      t.timestamps
    end
  end
end
