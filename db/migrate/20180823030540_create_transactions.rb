class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :buyer_id
      t.integer :artwork_id
    end
  end
end
