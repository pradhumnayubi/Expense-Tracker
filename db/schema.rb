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

ActiveRecord::Schema[7.1].define(version: 2024_07_16_070935) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "department_id", null: false
    t.string "employment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
  end

  create_table "expense_reports", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.string "status"
    t.text "comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_expense_reports_on_employee_id"
  end

  create_table "expenses", force: :cascade do |t|
    t.bigint "employee_id", null: false
    t.bigint "expense_report_id"
    t.date "date"
    t.text "description"
    t.decimal "amount", precision: 10, scale: 2
    t.integer "invoice_number"
    t.string "supporting_document"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_expenses_on_employee_id"
    t.index ["expense_report_id"], name: "index_expenses_on_expense_report_id"
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "expense_reports", "employees"
  add_foreign_key "expenses", "employees"
  add_foreign_key "expenses", "expense_reports"
end
