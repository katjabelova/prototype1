# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180314114136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "model_group_consists_of_models", force: :cascade do |t|
    t.bigint "model_group_id"
    t.bigint "model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_group_id"], name: "index_model_group_consists_of_models_on_model_group_id"
    t.index ["model_id"], name: "index_model_group_consists_of_models_on_model_id"
  end

  create_table "model_groups", force: :cascade do |t|
    t.string "group_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "image_path"
  end

  create_table "models", force: :cascade do |t|
    t.string "model_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.string "image_paths", default: [], array: true
    t.string "input_parameters", default: [], array: true
    t.string "output_parameters", default: [], array: true
  end

  create_table "models_visibles", force: :cascade do |t|
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "model_group_consists_of_model_id"
    t.index ["model_group_consists_of_model_id"], name: "index_models_visibles_on_model_group_consists_of_model_id"
    t.index ["role_id"], name: "index_models_visibles_on_role_id"
  end

  create_table "role_has_widgets", force: :cascade do |t|
    t.bigint "role_id"
    t.bigint "widget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_role_has_widgets_on_role_id"
    t.index ["widget_id"], name: "index_role_has_widgets_on_widget_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "role_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.datetime "confirmed_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "widgets", force: :cascade do |t|
    t.string "widget_type"
    t.string "value"
    t.string "widget_name"
    t.string "path"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "model_group_consists_of_models", "model_groups"
  add_foreign_key "model_group_consists_of_models", "models"
  add_foreign_key "models_visibles", "model_group_consists_of_models"
  add_foreign_key "models_visibles", "roles"
  add_foreign_key "role_has_widgets", "roles"
  add_foreign_key "role_has_widgets", "widgets"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
