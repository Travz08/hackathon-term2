# # Rubo cop needs a comment here
class CreatePuppies < ActiveRecord::Migration[5.1]
  def change
    create_table :puppies do |t|
      t.string :name
      t.string :age
      t.string :breed
      t.string :size
      t.string :gender
      t.text :bio
      t.boolean :desexed
      t.boolean :vaccinated
      t.integer :adoption_fee

      t.timestamps
    end
  end
end
