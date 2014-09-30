class MenuItem < ActiveRecord::Base

  belongs_to :menu_category

  validates_presence_of :name, :menu_category, :picture

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/


end
