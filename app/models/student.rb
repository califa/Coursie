class Student < User

  has_many :enrollments
  has_many :courses, :through => :enrollments


  def name
    "#{first_name} #{last_name}"
  end

  def list_name
    "#{last_name}, #{first_name}"
  end

end
