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

ActiveRecord::Schema[7.0].define(version: 2022_05_15_211516) do
  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "isFull"
  end

  create_table "email_objects", force: :cascade do |t|
    t.integer "email_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email_id"], name: "index_email_objects_on_email_id"
    t.index ["student_id"], name: "index_email_objects_on_student_id"
  end

  create_table "emails", force: :cascade do |t|
    t.string "sender"
    t.string "reciever"
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ccList"
    t.boolean "spam"
    t.boolean "trash"
    t.boolean "archive"
  end

  create_table "lineups", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "waitlist_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_lineups_on_student_id"
    t.index ["waitlist_id"], name: "index_lineups_on_waitlist_id"
  end

  create_table "seats", force: :cascade do |t|
    t.integer "Course_id", null: false
    t.integer "Student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Course_id"], name: "index_seats_on_Course_id"
    t.index ["Student_id"], name: "index_seats_on_Student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "major"
    t.integer "year"
  end

  create_table "waitlists", force: :cascade do |t|
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_waitlists_on_course_id"
  end

  add_foreign_key "email_objects", "emails"
  add_foreign_key "email_objects", "students"
  add_foreign_key "lineups", "students"
  add_foreign_key "lineups", "waitlists"
  add_foreign_key "seats", "Courses"
  add_foreign_key "seats", "Students"
  add_foreign_key "waitlists", "courses"
end
