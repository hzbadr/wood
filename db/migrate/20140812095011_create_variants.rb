class CreateVariants < ActiveRecord::Migration
  def change
    create_table :variants do |t|
      t.decimal :weight
      t.decimal :width
      t.decimal :height
      t.decimal :depth
      t.references :product, index: true
      t.decimal :cost_price
      t.decimal :price

      t.timestamps
    end
  end
end
