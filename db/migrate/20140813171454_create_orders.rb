class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :number
      t.decimal :total, precision: 8, scale: 2
      t.string :state
      t.string :type, default: 'Order'
      
      t.datetime :completed_at

      t.references :customer, index: true
      t.references :created_by, index: true

      t.timestamps
    end
  end
end
