class CreateStockTransfers < ActiveRecord::Migration
  def change
    create_table :stock_transfers do |t|
      t.references :source, index: true
      t.references :product, index: true
      t.integer :quantity
      t.date :date

      t.timestamps
    end
  end
end
