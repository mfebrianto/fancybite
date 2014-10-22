class AddKelurahanToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :kecamatan, :string
    add_column :addresses, :kelurahan, :string
  end
end
