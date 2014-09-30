class BannerMenu < ActiveRecord::Base

  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :picture
  validates :picture, dimensions: { width: 1600, height: 568 }

end