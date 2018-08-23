class CreateArtworks < ActiveRecord::Migration[5.2]
  def change
    create_table :artworks do |t|
      t.string :name
      t.integer :creator_id
      t.string :price
      t.string :img
      t.string :description
      t.integer :quantity
    end
  end
end
