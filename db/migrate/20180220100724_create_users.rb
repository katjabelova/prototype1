class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true, null: false
      t.string :first_name
      t.string :last_name
      t.string :password
      t.timestamp :confirmed_at

      t.timestamps
    end
  end
end
