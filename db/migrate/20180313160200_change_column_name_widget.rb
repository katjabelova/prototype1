class ChangeColumnNameWidget < ActiveRecord::Migration[5.1]
  def change
    rename_column :widgets, :type, :widget_type
  end
end
