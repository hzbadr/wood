class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
      t.references :variant, index: true
      t.decimal :quantity
      t.date :date

      t.timestamps
    end
  end
end
