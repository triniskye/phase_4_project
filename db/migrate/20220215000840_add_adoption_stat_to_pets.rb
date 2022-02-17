class AddAdoptionStatToPets < ActiveRecord::Migration[6.1]
  def change
    add_column :pets, :adoptable, :boolean
  end
end
