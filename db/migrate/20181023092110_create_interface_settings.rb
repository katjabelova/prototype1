class CreateInterfaceSettings < ActiveRecord::Migration[5.1]
  def change
    create_table :interface_settings do |t|
      t.string :de_name
      t.string :eng_name

      t.timestamps
    end
  end
end
