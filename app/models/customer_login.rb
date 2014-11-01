class CustomerLogin < ActiveRecord::Base

  self.table_name = 'customers'

  validates_presence_of :email
  validates_presence_of :password

end
