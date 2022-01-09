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

ActiveRecord::Schema.define(version: 2021_11_18_232102) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "scheduled_tasks", force: :cascade do |t|
    t.bigint "task_id"
    t.datetime "started"
    t.datetime "finished"
    t.datetime "due"
    t.interval "interval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_scheduled_tasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.bigint "parent_id"
    t.string "name"
    t.integer "position"
    t.integer "urgency"
    t.integer "success"
    t.integer "failure"
    t.string "webLink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_tasks_on_parent_id"
  end

  add_foreign_key "scheduled_tasks", "tasks", on_delete: :cascade
  add_foreign_key "tasks", "tasks", column: "parent_id", on_delete: :cascade
end
