class Admin < User


  def name
    "#{first_name} #{last_name}"
  end


end
