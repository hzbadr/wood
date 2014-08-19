class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :product, index: true
      t.references :warehouse, index: true
      
      t.decimal :quantity, precision: 8, scale: 2
      t.date :date

      t.timestamps
    end
  end
end
