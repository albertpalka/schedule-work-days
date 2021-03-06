# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_11_184634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "employees", force: :cascade do |t|
    t.string "full_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "title"
    t.date "schedule_from"
    t.date "schedule_to"
    t.time "default_start_time"
    t.time "default_end_time"
    t.time "default_break_start"
    t.time "default_break_end"
    t.boolean "active", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_schedules_on_employee_id"
  end

  create_table "work_days", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "schedule_id", null: false
    t.date "work_date"
    t.time "start_time"
    t.time "end_time"
    t.time "break_start"
    t.time "break_end"
    t.integer "day_type", default: 0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["employee_id"], name: "index_work_days_on_employee_id"
    t.index ["schedule_id"], name: "index_work_days_on_schedule_id"
  end

  add_foreign_key "schedules", "employees"
  add_foreign_key "work_days", "employees"
  add_foreign_key "work_days", "schedules"
end
