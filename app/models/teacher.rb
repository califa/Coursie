class Teacher < User

  has_many :courses

  def name
      "#{first_name} #{last_name}"
  end

  def list_name
    "#{last_name}, #{first_name}"
  end

end
