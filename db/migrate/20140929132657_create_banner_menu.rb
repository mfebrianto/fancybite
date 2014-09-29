class CreateBannerMenu < ActiveRecord::Migration
  def change
    create_table :banner_menus do |t|
      t.integer :sequence
      t.string :url
    end
  end
end
