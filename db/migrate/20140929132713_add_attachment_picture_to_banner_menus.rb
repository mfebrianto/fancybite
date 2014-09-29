class AddAttachmentPictureToBannerMenus < ActiveRecord::Migration
  def self.up
    change_table :banner_menus do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :banner_menus, :picture
  end
end
