class CreateEnrollments < ActiveRecord::Migration
  def self.up
    create_table :enrollments do |t|

      t.references :student
      t.references :course

      t.integer :grade

      t.timestamps
    end
    add_index("enrollments","student_id")
    add_index("enrollments","course_id")
  end

  def self.down
    drop_table :enrollments
  end
end
