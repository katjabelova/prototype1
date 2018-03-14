class CreateRoleHasWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :role_has_widgets do |t|
      t.references :role, foreign_key: true
      t.references :widget, foreign_key: true

      t.timestamps
    end
  end
end
