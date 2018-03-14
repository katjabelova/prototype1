class CreateWidgets < ActiveRecord::Migration[5.1]
  def change
    create_table :widgets do |t|
      t.string :type
      t.string :value
      t.string :widget_name
      t.string :path

      t.timestamps
    end
  end
end
