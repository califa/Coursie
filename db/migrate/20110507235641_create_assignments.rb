class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|

      t.references :course

      t.string :title
      t.text :description
      t.date :due_date

      t.timestamps
    end
    add_index("assignments","course_id")
  end

  def self.down
    drop_table :assignments
  end
end
