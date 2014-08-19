class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :weight, precision: 8, scale: 2
      t.decimal :width, precision: 8, scale: 2
      t.decimal :height, precision: 8, scale: 2
      t.decimal :depth, precision: 8, scale: 2
      
      t.decimal :cost_price, precision: 8, scale: 2
      t.decimal :price, precision: 8, scale: 2

      t.decimal :stock_amount, precision: 8, scale: 2

      t.references :category, index: true
      t.references :warehouse, index: true

      t.timestamps
    end
  end
end
