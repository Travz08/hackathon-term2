class CreateFavoritePuppies < ActiveRecord::Migration[5.1]
  def change
    create_table :favorite_puppies do |t|
      t.references :user, foreign_key: true
      t.references :puppies, foreign_key: true

      t.timestamps
    end
  end
end
