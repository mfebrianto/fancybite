class MenuCategory < ActiveRecord::Base

  has_many :menu_items

  validates_presence_of :name

  def first?
    self.id == MenuCategory.first.id
  end

end
