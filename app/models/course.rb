class Course < ActiveRecord::Base

  belongs_to :teacher
  has_many :assignments
  has_many :enrollments
  has_many :students, :through => :enrollments

  attr_accessor :time_hours, :time_minutes, :duration_hours, :duration_minutes

  before_validation :get_time_and_duration
 # before_save :capitalize_name
  validates_presence_of :teacher
  validates_presence_of :name
  validates_length_of :name, :within => 3..255
  validates_presence_of :day
  validates_length_of :day, :minimum => 3
  validates_presence_of :time
  validates_length_of :time, :is => 4
  validates_presence_of :duration
  validates_length_of :duration, :is => 4

  scope :sorted, order('courses.name ASC')


  private

  def get_time_and_duration
    #self.time = "#{format("%02d", time_hours.to_i)}#{format("%02d", time_minutes.to_i)}"
    #self.duration = "#{format("%02d", duration_hours.to_i)}#{format("%02d", duration_minutes.to_i)}"
    self.time = "#{self.time_hours}#{self.time_minutes}"
    self.duration = "#{self.duration_hours}#{self.duration_minutes}"
    puts "This is the time: #{time_hours}"
    puts self.duration
  end

  def capitalize_name
    self.name.capitalize!
  end
end
