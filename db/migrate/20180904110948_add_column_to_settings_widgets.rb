class AddColumnToSettingsWidgets < ActiveRecord::Migration[5.1]
  def change
      add_column :settings_widgets, :parent, :integer
  end
end
