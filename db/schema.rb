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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110508060022) do

  create_table "assignment_statuses", :force => true do |t|
    t.integer  "enrollment_id"
    t.integer  "assignment_id"
    t.boolean  "complete"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignment_statuses", ["assignment_id"], :name => "index_assignment_statuses_on_assignment_id"
  add_index "assignment_statuses", ["enrollment_id"], :name => "index_assignment_statuses_on_enrollment_id"

  create_table "assignments", :force => true do |t|
    t.integer  "course_id"
    t.string   "title"
    t.text     "description"
    t.date     "due_date"
    t.boolean  "test"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["course_id"], :name => "index_assignments_on_course_id"

  create_table "courses", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.text     "description"
    t.string   "day"
    t.string   "time"
    t.string   "duration"
    t.string   "place"
    t.boolean  "open"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "courses", ["name"], :name => "index_courses_on_name"
  add_index "courses", ["teacher_id"], :name => "index_courses_on_teacher_id"

  create_table "enrollments", :force => true do |t|
    t.integer  "student_id"
    t.integer  "course_id"
    t.integer  "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "enrollments", ["course_id"], :name => "index_enrollments_on_course_id"
  add_index "enrollments", ["student_id"], :name => "index_enrollments_on_student_id"

  create_table "users", :force => true do |t|
    t.string   "email",                     :default => "", :null => false
    t.string   "first_name",  :limit => 50
    t.string   "last_name",   :limit => 50
    t.string   "hashed_pass"
    t.string   "salt"
    t.string   "major"
    t.string   "type",        :limit => 10
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"

end
