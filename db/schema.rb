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

ActiveRecord::Schema[8.0].define(version: 2025_12_04_003742) do
  create_table "courses", force: :cascade do |t|
    t.integer "prefix_id", null: false
    t.integer "number"
    t.text "syllabus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["prefix_id"], name: "index_courses_on_prefix_id"
  end

  create_table "prefixes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "section_number"
    t.index ["course_id"], name: "index_sections_on_course_id"
  end

  create_table "sections_students", id: false, force: :cascade do |t|
    t.integer "section_id", null: false
    t.integer "student_id", null: false
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courses", "prefixes"
  add_foreign_key "sections", "courses"
end
