module UserInstance

  validates :first_name, :presence => true, :length => { :maximum => 50 }
  validates :last_name, :presence => true, :length => { :maximum => 50 }
  validates :email, :presence => true, :length => { :maximum => 100 },
    :format => EMAIL_REGEX, :confirmation => true

  validates_length_of :password, :within => 8..25, :on => :create

  before_save :create_hashed_password
  after_save :clear_password

  # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_pass == self.hash_with_salt(password, salt)
  end

  protected

  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = self.make_salt(email) if salt.blank?
      self.hashed_pass = self.hash_with_salt(password, salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end

end