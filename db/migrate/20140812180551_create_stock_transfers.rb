class CreateStockTransfers < ActiveRecord::Migration
  def change
    create_table :stock_transfers do |t|
      t.references :source, polymorphic: true
      t.references :destination, polymorphic: true
      t.references :product, index: true
      t.integer :quantity
      t.date :date

      t.timestamps
    end
  end
end
