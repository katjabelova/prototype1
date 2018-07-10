class AddOrderNumberToQuestionnaire < ActiveRecord::Migration[5.1]
  def change
      add_column :questionnaires, :order_number, :integer
  end
end
