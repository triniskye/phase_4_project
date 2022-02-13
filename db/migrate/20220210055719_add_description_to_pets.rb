class AddDescriptionToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :description, :string
  end
end
