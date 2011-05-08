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

ActiveRecord::Schema.define(:version => 20110507235645) do

  create_table "admins", :force => true do |t|
    t.string   "email",                     :default => "", :null => false
    t.string   "first_name",  :limit => 50
    t.string   "last_name",   :limit => 50
    t.string   "hashed_pass"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], :name => "index_admins_on_email"

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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assignments", ["course_id"], :name => "index_assignments_on_course_id"

  create_table "courses", :force => true do |t|
    t.integer  "teacher_id"
    t.string   "name"
    t.text     "description"
    t.string   "day"
    t.integer  "time"
    t.integer  "duration"
    t.string   "place"
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

  create_table "students", :force => true do |t|
    t.string   "email",                     :default => "", :null => false
    t.string   "first_name",  :limit => 50
    t.string   "last_name",   :limit => 50
    t.string   "major",       :limit => 50
    t.string   "hashed_pass"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "students", ["email"], :name => "index_students_on_email"

  create_table "teachers", :force => true do |t|
    t.string   "email",                     :default => "", :null => false
    t.string   "first_name",  :limit => 50
    t.string   "last_name",   :limit => 50
    t.string   "hashed_pass"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teachers", ["email"], :name => "index_teachers_on_email"

end
