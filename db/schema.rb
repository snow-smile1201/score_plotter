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

ActiveRecord::Schema.define(version: 2023_12_28_022438) do

  create_table "results", force: :cascade do |t|
    t.integer "student_id", null: false
    t.float "personality"
    t.float "self_image"
    t.float "communication"
    t.float "thinking_ability"
    t.float "basic_score"
    t.integer "times"
    t.integer "class_rank"
    t.integer "grade_rank"
    t.integer "weekly_achievement"
    t.integer "monthly_achievement"
    t.float "mvp_percentage"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["student_id"], name: "index_results_on_student_id"
  end

  create_table "students", primary_key: "student_number", force: :cascade do |t|
    t.string "name"
    t.string "class_type"
    t.string "group"
    t.string "admission_date"
    t.integer "grade"
    t.boolean "is_active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
