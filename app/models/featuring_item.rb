class FeaturingItem < ActiveRecord::Base

  belongs_to :menu_item

  validates_uniqueness_of :menu_item


end
