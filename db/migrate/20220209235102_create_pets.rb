class CreatePets < ActiveRecord::Migration[6.1]
  def change
    create_table :pets do |t|
      t.string :name
      t.string :age
      t.string :gender
      t.string :breed
      t.string :url

      t.timestamps
    end
  end
end

