class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|

      t.string :email, :default => "", :null => false
      t.string :first_name, :limit => 50
      t.string :last_name, :limit => 50

      t.string :hashed_pass
      t.string :salt

      t.timestamps

    end
    add_index("admins","email")
  end

  def self.down
    drop_table :admins
  end
end
