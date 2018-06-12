class CreateModelHasSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :model_has_settings do |t|
      t.references :models, foreign_key: true
      t.references :settings_widgets, foreign_key: true

      t.timestamps
    end
  end
end
