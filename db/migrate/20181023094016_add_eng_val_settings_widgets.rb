class AddEngValSettingsWidgets < ActiveRecord::Migration[5.1]
  def change
    add_column :settings_widgets, :eng_value, :string
  end
end
