class Enrollment < ActiveRecord::Base

  validates_presence_of :course_id
  validates_presence_of :student_id

  belongs_to :student
  belongs_to :course
  has_many :assignment_statuses
  has_many :assignments, :through => :assignment_statuses

end
