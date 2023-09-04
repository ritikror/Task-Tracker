ActiveRecord::Schema[7.0].define(version: 2023_09_04_104039) do
  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "time"
    t.string "assign_to"
    t.string "status"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "timers", force: :cascade do |t|
    t.string "countdown"
    t.integer "user_id", null: false
    t.integer "task_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_timers_on_task_id"
    t.index ["user_id"], name: "index_timers_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.string "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "tasks", "users"
  add_foreign_key "timers", "tasks"
  add_foreign_key "timers", "users"
end
