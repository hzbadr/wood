class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount, precision: 8, scale: 2
      t.references :source, index: true
      t.string :state
      t.references :payment_method, index: true
      t.references :payable, polymorphic: true

      t.timestamps
    end
  end
end
