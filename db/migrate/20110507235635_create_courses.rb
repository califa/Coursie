class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|

      t.references :teacher

      t.string :name
      t.text :description

      t.string :day
      t.integer :time
      t.integer :duration
      t.string :place

      t.boolean :open

      t.timestamps
    end
    add_index("courses","name")
    add_index("courses","teacher_id")
  end

  def self.down
    drop_table :courses
  end
end
