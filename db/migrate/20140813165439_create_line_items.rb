class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :product, index: true
      t.decimal :quantity, precision: 8, scale: 2
      t.decimal :price, precision: 8, scale: 2
      t.decimal :cost_price, precision: 8, scale: 2
      t.references :order, index: true

      t.timestamps
    end
  end
end
