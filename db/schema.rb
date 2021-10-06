# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_10_06_125109) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatroom_assigns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "chatroom_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_chatroom_assigns_on_chatroom_id"
    t.index ["user_id"], name: "index_chatroom_assigns_on_user_id"
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kanban_columns", force: :cascade do |t|
    t.string "name"
    t.bigint "kanban_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["kanban_id"], name: "index_kanban_columns_on_kanban_id"
  end

  create_table "kanbans", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.jsonb "cards"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_kanbans_on_project_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.bigint "user_id", null: false
    t.string "color"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "colour"
    t.index ["user_id"], name: "index_notes_on_user_id"
  end

  create_table "notifications", force: :cascade do |t|
    t.string "recipient_type", null: false
    t.bigint "recipient_id", null: false
    t.string "type", null: false
    t.jsonb "params"
    t.datetime "read_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["read_at"], name: "index_notifications_on_read_at"
    t.index ["recipient_type", "recipient_id"], name: "index_notifications_on_recipient"
  end

  create_table "project_assigns", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "project_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_project_assigns_on_project_id"
    t.index ["user_id"], name: "index_project_assigns_on_user_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.integer "progress"
    t.datetime "end_date"
    t.datetime "start_date"
    t.integer "status"
    t.datetime "date_created"
    t.string "date_modified"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "created_by"
  end

  create_table "task_assigns", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "user_id", null: false
    t.datetime "date_created"
    t.datetime "date_modified"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_task_assigns_on_task_id"
    t.index ["user_id"], name: "index_task_assigns_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "due_date"
    t.integer "status"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.integer "position"
    t.bigint "kanban_column_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "created_by"
    t.integer "priority"
    t.integer "duration"
    t.index ["kanban_column_id"], name: "index_tasks_on_kanban_column_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "position"
    t.datetime "date_created"
    t.datetime "date_modified"
    t.integer "phone"
    t.integer "gender"
    t.boolean "admin"
    t.string "nickname"
    t.integer "salary"
    t.integer "pay_cycle"
    t.integer "pay_due"
    t.datetime "birthdate"
    t.integer "employee_number"
    t.integer "tfn"
    t.integer "bank_account"
    t.integer "bank_bsb"
    t.integer "start_date"
    t.datetime "last_pay"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wikis", force: :cascade do |t|
    t.text "description"
    t.string "title"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "author"
    t.index ["user_id"], name: "index_wikis_on_user_id"
  end

  add_foreign_key "chatroom_assigns", "chatrooms"
  add_foreign_key "chatroom_assigns", "users"
  add_foreign_key "kanban_columns", "kanbans"
  add_foreign_key "kanbans", "projects"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "project_assigns", "projects"
  add_foreign_key "project_assigns", "users"
  add_foreign_key "task_assigns", "tasks"
  add_foreign_key "task_assigns", "users"
  add_foreign_key "tasks", "kanban_columns"
  add_foreign_key "wikis", "users"
end
