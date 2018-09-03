# This migration comes from questionnaires (originally 20170327125416)
class AddDisplayModeToModals < ActiveRecord::Migration[5.0]
  def change
    add_column :questionnaires_modals, :display_mode, :integer, default: 0, null: false
  end
end
