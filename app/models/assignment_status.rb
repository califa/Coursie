class AssignmentStatus < ActiveRecord::Base

  belongs_to :assignment
  belongs_to :enrollment

end
