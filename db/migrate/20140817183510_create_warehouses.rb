class CreateWarehouses < ActiveRecord::Migration
  def change
    create_table :warehouses do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :size

      t.timestamps
    end
  end
end
