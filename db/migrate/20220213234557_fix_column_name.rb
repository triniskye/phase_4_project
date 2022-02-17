class FixColumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :pets, :url, :image_address
  end
end
