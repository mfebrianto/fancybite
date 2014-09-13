class AddAttachmentPictureToMenuItems < ActiveRecord::Migration
  def self.up
    change_table :menu_items do |t|
      t.attachment :picture
    end
  end

  def self.down
    remove_attachment :menu_items, :picture
  end
end
