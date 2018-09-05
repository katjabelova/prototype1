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

ActiveRecord::Schema.define(version: 20180904110948) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "model_default_params", force: :cascade do |t|
    t.string "param_name"
    t.float "default_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_functions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "path"
    t.integer "order_number"
  end

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

  create_table "model_has_default_params", force: :cascade do |t|
    t.bigint "models_id"
    t.bigint "model_default_params_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_default_params_id"], name: "index_model_has_default_params_on_model_default_params_id"
    t.index ["models_id"], name: "index_model_has_default_params_on_models_id"
  end

  create_table "model_has_functions", force: :cascade do |t|
    t.bigint "models_id"
    t.bigint "model_functions_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_functions_id"], name: "index_model_has_functions_on_model_functions_id"
    t.index ["models_id"], name: "index_model_has_functions_on_models_id"
  end

  create_table "model_has_output_sets", force: :cascade do |t|
    t.bigint "models_id"
    t.bigint "model_output_sets_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_output_sets_id"], name: "index_model_has_output_sets_on_model_output_sets_id"
    t.index ["models_id"], name: "index_model_has_output_sets_on_models_id"
  end

  create_table "model_has_questionnaires", force: :cascade do |t|
    t.bigint "models_id"
    t.bigint "questionnaires_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["models_id"], name: "index_model_has_questionnaires_on_models_id"
    t.index ["questionnaires_id"], name: "index_model_has_questionnaires_on_questionnaires_id"
  end

  create_table "model_has_settings", force: :cascade do |t|
    t.bigint "models_id"
    t.bigint "settings_widgets_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["models_id"], name: "index_model_has_settings_on_models_id"
    t.index ["settings_widgets_id"], name: "index_model_has_settings_on_settings_widgets_id"
  end

  create_table "model_output_sets", force: :cascade do |t|
    t.string "title"
    t.string "chart_type"
    t.text "xcategories", default: [], array: true
    t.text "ycategories", default: [], array: true
    t.integer "order_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "xname"
    t.string "yname"
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

  create_table "params_in_functions", force: :cascade do |t|
    t.bigint "model_functions_id"
    t.bigint "model_default_params_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_default_params_id"], name: "index_params_in_functions_on_model_default_params_id"
    t.index ["model_functions_id"], name: "index_params_in_functions_on_model_functions_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.text "name"
    t.text "question"
    t.text "answer_type"
    t.text "answer_comment"
    t.string "answer_possibilities", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "upper_bound"
    t.float "lower_bound"
    t.integer "order_number"
    t.bigint "questionnaires_id"
    t.index ["questionnaires_id"], name: "index_questionnaires_on_questionnaires_id"
  end

  create_table "questionnaires_distribution_questions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_mode", default: 0, null: false
  end

  create_table "questionnaires_distribution_sub_answers", id: :serial, force: :cascade do |t|
    t.decimal "value"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questionnaires_distribution_sub_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_distribution_sub_answers_on_user_id"
  end

  create_table "questionnaires_distribution_sub_question_translations", force: :cascade do |t|
    t.integer "questionnaires_distribution_sub_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question"
    t.string "hint"
    t.index ["locale"], name: "index_52cbeac70d38cb80374e3fbf22ff726dfc12355c"
    t.index ["questionnaires_distribution_sub_question_id"], name: "index_f82840fc2e45f6fb10190b28c893e4b55663ab44"
  end

  create_table "questionnaires_distribution_sub_questions", id: :serial, force: :cascade do |t|
    t.string "label", null: false
    t.integer "rank", null: false
    t.integer "distribution_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["distribution_question_id"], name: "questionnaires_distribution_sub_questions_dq_idx"
  end

  create_table "questionnaires_experiment_answers", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "question_id", null: false
    t.integer "experiment_choice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_choice_id"], name: "index_questionnaires_experiment_answers_on_experiment_choice_id"
    t.index ["question_id"], name: "index_questionnaires_experiment_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_experiment_answers_on_user_id"
  end

  create_table "questionnaires_experiment_choice_translations", force: :cascade do |t|
    t.integer "questionnaires_experiment_choice_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "fields", default: [], null: false
    t.string "name", null: false
    t.index ["locale"], name: "index_questionnaires_experiment_choice_translations_on_locale"
    t.index ["questionnaires_experiment_choice_id"], name: "index_8204585c708f3be85176ec8dee1b5f5b9ddd33cb"
  end

  create_table "questionnaires_experiment_choices", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_experiment_question_translations", force: :cascade do |t|
    t.integer "questionnaires_experiment_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "fields", default: [], null: false
    t.string "select", null: false
    t.index ["locale"], name: "index_2f8d9a58070a8cb7eaff383afed1b20947b26dd0"
    t.index ["questionnaires_experiment_question_id"], name: "index_49b9ae309ffc7577e5e273f1b93d34d343edc873"
  end

  create_table "questionnaires_experiment_questions", id: :serial, force: :cascade do |t|
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_experiment_selection_group_choices", id: :serial, force: :cascade do |t|
    t.integer "experiment_choice_id", null: false
    t.integer "experiment_selection_group_id", null: false
    t.integer "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_choice_id"], name: "index_questionnaires_qesgcs_e_c"
    t.index ["experiment_selection_group_id"], name: "index_questionnaires_qesgcs_e_s_q"
  end

  create_table "questionnaires_experiment_selection_groups", id: :serial, force: :cascade do |t|
    t.integer "experiment_question_id", null: false
    t.integer "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_question_id"], name: "index_questionnaires_qegs_e_q"
  end

  create_table "questionnaires_experiment_selections", id: :serial, force: :cascade do |t|
    t.integer "experiment_question_id", null: false
    t.integer "experiment_choice_id", null: false
    t.integer "user_id", null: false
    t.integer "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["experiment_choice_id"], name: "index_questionnaires_qes_e_c"
    t.index ["experiment_question_id"], name: "index_questionnaires_qes_e_q"
    t.index ["user_id"], name: "index_questionnaires_experiment_selections_on_user_id"
  end

  create_table "questionnaires_group_parts", id: :serial, force: :cascade do |t|
    t.integer "rank", null: false
    t.boolean "disabled", default: false, null: false
    t.integer "group_id", null: false
    t.string "part_type", null: false
    t.integer "part_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_questionnaires_group_parts_on_group_id"
    t.index ["part_type", "part_id"], name: "index_questionnaires_group_parts_on_part_type_and_part_id"
  end

  create_table "questionnaires_group_translations", force: :cascade do |t|
    t.integer "questionnaires_group_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["locale"], name: "index_questionnaires_group_translations_on_locale"
    t.index ["questionnaires_group_id"], name: "index_0bf64f99dd56baf26c015e2f3c73b069d0dffbac"
  end

  create_table "questionnaires_groups", id: :serial, force: :cascade do |t|
    t.boolean "hidden", default: false, null: false
    t.integer "rank", null: false
    t.integer "questionnaire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questionnaires_groups_on_questionnaire_id"
  end

  create_table "questionnaires_modal_translations", force: :cascade do |t|
    t.integer "questionnaires_modal_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body", null: false
    t.string "header", null: false
    t.index ["locale"], name: "index_questionnaires_modal_translations_on_locale"
    t.index ["questionnaires_modal_id"], name: "index_9c8b34dbfe720ee5a0314c8f451abae9e3e24f72"
  end

  create_table "questionnaires_modals", id: :serial, force: :cascade do |t|
    t.integer "text_part_id", null: false
    t.string "href_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "display_mode", default: 0, null: false
    t.index ["text_part_id"], name: "index_questionnaires_modals_on_text_part_id"
  end

  create_table "questionnaires_multi_scale_question_translations", force: :cascade do |t|
    t.integer "questionnaires_multi_scale_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scales", default: [], array: true
    t.string "left"
    t.string "right"
    t.index ["locale"], name: "index_47e238f5e60e31a270a112dca6dde78f2e88006f"
    t.index ["questionnaires_multi_scale_question_id"], name: "index_8ef26b7a204e457c474ae3cd0e5aa915f43dc960"
  end

  create_table "questionnaires_multi_scale_questions", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_multi_scale_sub_questions", id: :serial, force: :cascade do |t|
    t.integer "rank", default: 1, null: false
    t.integer "scale_question_id"
    t.integer "multi_scale_question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["multi_scale_question_id", "rank"], name: "questionnaires_unique_mssq_msq_rank", unique: true
    t.index ["multi_scale_question_id"], name: "questionnaires_fk_mssq_msq"
    t.index ["scale_question_id"], name: "questionnaires_fk_mssq_sq"
  end

  create_table "questionnaires_number_answers", id: :serial, force: :cascade do |t|
    t.decimal "value"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questionnaires_number_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_number_answers_on_user_id"
  end

  create_table "questionnaires_number_question_translations", force: :cascade do |t|
    t.integer "questionnaires_number_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefix"
    t.string "suffix"
    t.index ["locale"], name: "index_questionnaires_number_question_translations_on_locale"
    t.index ["questionnaires_number_question_id"], name: "index_6bf7ecbe5e7fcb571bbfa8bfcfe00e283764ef39"
  end

  create_table "questionnaires_number_questions", id: :serial, force: :cascade do |t|
    t.string "label", null: false
    t.decimal "min", null: false
    t.decimal "max", null: false
    t.decimal "step", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_questionnaire_exports", id: :serial, force: :cascade do |t|
    t.integer "format", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.string "result"
    t.integer "questionnaire_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["questionnaire_id"], name: "index_questionnaires_questionnaire_exports_on_questionnaire_id"
  end

  create_table "questionnaires_questionnaire_translations", force: :cascade do |t|
    t.integer "questionnaires_questionnaire_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.index ["locale"], name: "index_questionnaires_questionnaire_translations_on_locale"
    t.index ["questionnaires_questionnaire_id"], name: "index_914433fbe32217719e262f7d7d6c8b1413e689b6"
  end

  create_table "questionnaires_questionnaires", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_scale_answers", id: :serial, force: :cascade do |t|
    t.integer "value"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questionnaires_scale_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_scale_answers_on_user_id"
  end

  create_table "questionnaires_scale_question_translations", force: :cascade do |t|
    t.integer "questionnaires_scale_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "left"
    t.string "scales", default: [], array: true
    t.string "right"
    t.string "explanation_left"
    t.string "explanation_right"
    t.index ["locale"], name: "index_questionnaires_scale_question_translations_on_locale"
    t.index ["questionnaires_scale_question_id"], name: "index_da8b37a0259ec56582ef33626dbb892b9963f0aa"
  end

  create_table "questionnaires_scale_questions", id: :serial, force: :cascade do |t|
    t.string "label", null: false
    t.integer "highlight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_select_answers", id: :serial, force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.string "value"
    t.string "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questionnaires_select_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_select_answers_on_user_id"
  end

  create_table "questionnaires_select_question_translations", force: :cascade do |t|
    t.integer "questionnaires_select_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "other"
    t.string "choices", default: [], array: true
    t.index ["locale"], name: "index_questionnaires_select_question_translations_on_locale"
    t.index ["questionnaires_select_question_id"], name: "index_c1145c5bd3f8c18cff58e65334e8e86658299ea6"
  end

  create_table "questionnaires_select_questions", id: :serial, force: :cascade do |t|
    t.string "label", null: false
    t.integer "display_mode", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_slider_answers", id: :serial, force: :cascade do |t|
    t.decimal "value"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questionnaires_slider_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_slider_answers_on_user_id"
  end

  create_table "questionnaires_slider_question_translations", force: :cascade do |t|
    t.integer "questionnaires_slider_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.json "hints", default: {}
    t.string "left"
    t.string "right"
    t.index ["locale"], name: "index_questionnaires_slider_question_translations_on_locale"
    t.index ["questionnaires_slider_question_id"], name: "index_b67891a7b25f1c76e84e238d47b2fcc64b84b685"
  end

  create_table "questionnaires_slider_questions", id: :serial, force: :cascade do |t|
    t.integer "min", default: 0, null: false
    t.integer "max", default: 100, null: false
    t.integer "steps", default: 50, null: false
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_table_cells", id: :serial, force: :cascade do |t|
    t.integer "table_part_id", null: false
    t.integer "row", null: false
    t.integer "col", null: false
    t.string "part_type", null: false
    t.integer "part_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["part_type", "part_id"], name: "index_questionnaires_table_cells_on_part_type_and_part_id"
    t.index ["table_part_id"], name: "index_questionnaires_table_cells_on_table_part_id"
  end

  create_table "questionnaires_table_parts", id: :serial, force: :cascade do |t|
    t.integer "rows", null: false
    t.integer "cols", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_text_answers", id: :serial, force: :cascade do |t|
    t.string "value"
    t.integer "question_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_questionnaires_text_answers_on_question_id"
    t.index ["user_id"], name: "index_questionnaires_text_answers_on_user_id"
  end

  create_table "questionnaires_text_part_translations", force: :cascade do |t|
    t.integer "questionnaires_text_part_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "body", null: false
    t.index ["locale"], name: "index_questionnaires_text_part_translations_on_locale"
    t.index ["questionnaires_text_part_id"], name: "index_7fa7c5a210fca7f798e7cacc4804b4b48bc0ddce"
  end

  create_table "questionnaires_text_parts", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questionnaires_text_question_translations", force: :cascade do |t|
    t.integer "questionnaires_text_question_id", null: false
    t.string "locale", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "prefix"
    t.string "suffix"
    t.index ["locale"], name: "index_questionnaires_text_question_translations_on_locale"
    t.index ["questionnaires_text_question_id"], name: "index_8a20cdf15b667a23b4f20b99c3915fdd5d41f326"
  end

  create_table "questionnaires_text_questions", id: :serial, force: :cascade do |t|
    t.boolean "short", default: false, null: false
    t.string "label", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  create_table "settings_widgets", force: :cascade do |t|
    t.string "name"
    t.float "min"
    t.float "max"
    t.float "step"
    t.float "inner_step"
    t.float "default_value"
    t.integer "order_number"
    t.bigint "model_default_params_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "value"
    t.string "title"
    t.integer "parent"
    t.index ["model_default_params_id"], name: "index_settings_widgets_on_model_default_params_id"
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
  add_foreign_key "model_has_default_params", "model_default_params", column: "model_default_params_id"
  add_foreign_key "model_has_default_params", "models", column: "models_id"
  add_foreign_key "model_has_functions", "model_functions", column: "model_functions_id"
  add_foreign_key "model_has_functions", "models", column: "models_id"
  add_foreign_key "model_has_output_sets", "model_output_sets", column: "model_output_sets_id"
  add_foreign_key "model_has_output_sets", "models", column: "models_id"
  add_foreign_key "model_has_questionnaires", "models", column: "models_id"
  add_foreign_key "model_has_questionnaires", "questionnaires", column: "questionnaires_id"
  add_foreign_key "model_has_settings", "models", column: "models_id"
  add_foreign_key "model_has_settings", "settings_widgets", column: "settings_widgets_id"
  add_foreign_key "models_visibles", "model_group_consists_of_models"
  add_foreign_key "models_visibles", "roles"
  add_foreign_key "params_in_functions", "model_default_params", column: "model_default_params_id"
  add_foreign_key "params_in_functions", "model_functions", column: "model_functions_id"
  add_foreign_key "questionnaires", "questionnaires", column: "questionnaires_id"
  add_foreign_key "questionnaires_distribution_sub_answers", "questionnaires_distribution_sub_questions", column: "question_id"
  add_foreign_key "questionnaires_distribution_sub_answers", "users"
  add_foreign_key "questionnaires_distribution_sub_questions", "questionnaires_distribution_questions", column: "distribution_question_id"
  add_foreign_key "questionnaires_experiment_answers", "questionnaires_experiment_choices", column: "experiment_choice_id"
  add_foreign_key "questionnaires_experiment_answers", "questionnaires_experiment_questions", column: "question_id"
  add_foreign_key "questionnaires_experiment_answers", "users"
  add_foreign_key "questionnaires_experiment_selection_group_choices", "questionnaires_experiment_choices", column: "experiment_choice_id"
  add_foreign_key "questionnaires_experiment_selection_group_choices", "questionnaires_experiment_selection_groups", column: "experiment_selection_group_id"
  add_foreign_key "questionnaires_experiment_selection_groups", "questionnaires_experiment_questions", column: "experiment_question_id"
  add_foreign_key "questionnaires_experiment_selections", "questionnaires_experiment_choices", column: "experiment_choice_id"
  add_foreign_key "questionnaires_experiment_selections", "questionnaires_experiment_questions", column: "experiment_question_id"
  add_foreign_key "questionnaires_experiment_selections", "users"
  add_foreign_key "questionnaires_group_parts", "questionnaires_groups", column: "group_id"
  add_foreign_key "questionnaires_groups", "questionnaires_questionnaires", column: "questionnaire_id"
  add_foreign_key "questionnaires_modals", "questionnaires_text_parts", column: "text_part_id"
  add_foreign_key "questionnaires_multi_scale_sub_questions", "questionnaires_multi_scale_questions", column: "multi_scale_question_id"
  add_foreign_key "questionnaires_multi_scale_sub_questions", "questionnaires_scale_questions", column: "scale_question_id"
  add_foreign_key "questionnaires_number_answers", "questionnaires_number_questions", column: "question_id"
  add_foreign_key "questionnaires_number_answers", "users"
  add_foreign_key "questionnaires_questionnaire_exports", "questionnaires_questionnaires", column: "questionnaire_id"
  add_foreign_key "questionnaires_scale_answers", "questionnaires_scale_questions", column: "question_id"
  add_foreign_key "questionnaires_scale_answers", "users"
  add_foreign_key "questionnaires_select_answers", "questionnaires_select_questions", column: "question_id"
  add_foreign_key "questionnaires_select_answers", "users"
  add_foreign_key "questionnaires_slider_answers", "questionnaires_slider_questions", column: "question_id"
  add_foreign_key "questionnaires_slider_answers", "users"
  add_foreign_key "questionnaires_table_cells", "questionnaires_table_parts", column: "table_part_id"
  add_foreign_key "questionnaires_text_answers", "questionnaires_text_questions", column: "question_id"
  add_foreign_key "questionnaires_text_answers", "users"
  add_foreign_key "role_has_widgets", "roles"
  add_foreign_key "role_has_widgets", "widgets"
  add_foreign_key "settings_widgets", "model_default_params", column: "model_default_params_id"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
