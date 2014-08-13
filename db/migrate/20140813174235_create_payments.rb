class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.references :order, index: true
      t.references :customer, index: true
      t.string :state
      t.references :payment_method, index: true

      t.timestamps
    end
  end
end
