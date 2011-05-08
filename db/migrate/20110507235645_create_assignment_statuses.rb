class CreateAssignmentStatuses < ActiveRecord::Migration
  def self.up
    create_table :assignment_statuses do |t|

      t.references :enrollment
      t.references :assignment

      t.boolean :complete

      t.timestamps
    end
    add_index("assignment_statuses","enrollment_id")
    add_index("assignment_statuses","assignment_id")
  end

  def self.down
    drop_table :assignment_statuses
  end
end
