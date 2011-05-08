class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|

      t.string :email, :default => "", :null => false
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50
      t.string :major, :limit => 50

      t.string :hashed_pass
      t.string :salt

      t.timestamps

    end
    add_index("students", "email")
  end

  def self.down
    drop_table :students
  end
end
