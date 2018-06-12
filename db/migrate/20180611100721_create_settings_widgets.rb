class CreateSettingsWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :settings_widgets do |t|
      t.string :name
      t.float :min
      t.float :max
      t.float :step
      t.float :inner_step
      t.float :default_value
      t.integer :order_number
      t.references :model_default_params, foreign_key: true

      t.timestamps
    end
  end
end
