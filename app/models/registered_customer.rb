class RegisteredCustomer < Customer

  attr_accessor :password_confirmation

  validates_presence_of :password
  validates_presence_of :password_confirmation
  validate :check_password_equal_password_confirmation,
           :check_password_length


  private

  def check_password_equal_password_confirmation
    unless password_and_password_confirmation_exist?
      return
    end
    unless self.password == password_confirmation
      errors.add(:password_confirmation, 'is not equal the password')
    end
  end

  def check_password_length
    unless self.password.blank?
      if self.password.length < 8
        errors.add(:password, 'must at least 8 characters long')
      end
    end
  end

  def password_and_password_confirmation_exist?
    self.password && password_confirmation
  end

end