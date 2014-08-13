class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :number
      t.decimal :total
      t.string :state
      t.references :customer, index: true
      t.datetime :completed_at
      t.references :created_by, index: true

      t.timestamps
    end
  end
end
