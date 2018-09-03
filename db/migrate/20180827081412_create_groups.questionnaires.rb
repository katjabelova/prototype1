# This migration comes from questionnaires (originally 20150317133858)
class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :questionnaires_groups do |t|
      t.boolean :hidden, default: false, null: false
      t.integer :rank, null: false
      t.references :questionnaire, index: true, null: false

      t.timestamps null: false
    end
    add_foreign_key :questionnaires_groups, :questionnaires_questionnaires, column: :questionnaire_id
    reversible do |dir|
      dir.up do
        Questionnaires::Group.create_translation_table! title: {type: :string, null: :false}
      end

      dir.down do
        Questionnaires::Group.drop_translation_table!
      end
    end

  end
end
