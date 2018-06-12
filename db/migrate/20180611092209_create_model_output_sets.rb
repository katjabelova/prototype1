class CreateModelOutputSets < ActiveRecord::Migration[5.1]
  def change
    create_table :model_output_sets do |t|
      t.string :title
      t.string :chart_type
      t.text :xcategories, array: true, default: []
      t.text :ycategories, array: true, default: []
      t.integer :order_number

      t.timestamps
    end
  end
end
