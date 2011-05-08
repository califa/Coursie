class Student < ActiveRecord::Base

  has_many :enrollments

  def name
    "#{first_name} #{last_name}"
  end

  def list_name
    "#{last_name}, #{first_name}"
  end

end
