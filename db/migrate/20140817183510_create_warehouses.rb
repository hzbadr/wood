class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.decimal :size, precision: 8, scale: 2

      t.timestamps
    end
  end
end
