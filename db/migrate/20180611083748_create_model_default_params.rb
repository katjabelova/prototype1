class CreateModelDefaultParams < ActiveRecord::Migration[5.1]
  def change
    create_table :model_default_params do |t|
      t.string :param_name
      t.float :default_value

      t.timestamps
    end
  end
end
