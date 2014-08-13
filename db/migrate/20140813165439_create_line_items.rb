class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.references :variant, index: true
      t.decimal :quantity
      t.decimal :price
      t.decimal :cost_price
      t.references :order, index: true

      t.timestamps
    end
  end
end
