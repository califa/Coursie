class Assignment < ActiveRecord::Base

  validates_presence_of :title
  validates_length_of :title, :within => 4..130
  validates_presence_of :due_date
  validates_presence_of :course

  belongs_to :course
  has_many :assignment_statuses
  has_many :enrollments, :through => :assignment_statuses

end
