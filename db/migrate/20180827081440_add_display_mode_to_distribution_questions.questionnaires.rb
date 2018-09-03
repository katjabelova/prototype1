# This migration comes from questionnaires (originally 20170327152410)
class AddDisplayModeToDistributionQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questionnaires_distribution_questions, :display_mode, :integer, default: 0, null: false
  end
end
