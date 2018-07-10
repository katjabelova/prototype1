class AddLowerUpperBoundToQuestionnare < ActiveRecord::Migration[5.1]
  def change
    add_column :questionnaires, :upper_bound, :float
    add_column :questionnaires, :lower_bound, :float
  end
end
