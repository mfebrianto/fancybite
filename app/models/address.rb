class Address < ActiveRecord::Base

  belongs_to :customer

  validates_presence_of :address

end