class AddValueAndTitleToSettingsWidget < ActiveRecord::Migration[5.1]
  def change
      add_column :settings_widgets, :value, :string
      add_column :settings_widgets, :title, :string
  end
end
