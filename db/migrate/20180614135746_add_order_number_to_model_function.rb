class AddOrderNumberToModelFunction < ActiveRecord::Migration[5.1]
  def change
      add_column :model_functions, :order_number, :integer
  end
end
