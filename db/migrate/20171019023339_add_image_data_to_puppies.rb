class AddImageDataToPuppies < ActiveRecord::Migration[5.1]
  def change
    add_column :puppies, :image_data, :text
  end
end
