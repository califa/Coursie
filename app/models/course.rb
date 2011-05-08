class Course < ActiveRecord::Base

  belongs_to :teacher
  has_many :assignments
  has_many :enrollments

  validates_presence_of :name
  validates_length_of :name, :within => 3..255
  validates_presence_of :day
  validates_length_of :day, :is => 3
  validates_presence_of :time
  validates_length_of :time, :is => 4
  validates_presence_of :duration
  validates_length_of :time, :is => 4
  validates_presence_of :name
  validates_length_of :name, :minimum => 6

  scope :sorted, order('courses.name ASC')

end
