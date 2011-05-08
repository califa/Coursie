class Assignment < ActiveRecord::Base

  belongs_to :course
  has_many :assignment_statuses
  has_many :enrollments, :through => :assignment_statuses

end
