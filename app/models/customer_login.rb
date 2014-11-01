class CustomerLogin < ActiveRecord::Base

  self.table_name = 'customers'

  validates_presence_of :email
  validates_presence_of :password
  validate :check_user_exist

  def customer
    registered_customer
  end

  private

  def check_user_exist
    unless registered_customer
      errors.add(:email, ' or password does not exist')
    end
  end

  def registered_customer
    CustomerLogin.where("email = ? and password = ?", email, password).first
  end


end
