# This migration comes from questionnaires (originally 20150317200557)
class CreateDistributionQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_distribution_questions do |t|
      t.timestamps
    end
  end
end
