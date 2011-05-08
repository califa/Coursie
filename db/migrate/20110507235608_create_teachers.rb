class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|

      t.string :email, :default => "", :null => false
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50

      t.string :hashed_pass
      t.string :salt

      t.timestamps

    end
    add_index("teachers","email")
  end

  def self.down
    drop_table :teachers
  end
end
