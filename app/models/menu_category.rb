class MenuCategory < ActiveRecord::Base

  has_many :menu_items

  validates_presence_of :name


end
