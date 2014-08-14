class AddPaymentsTotalToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :payment_total, :decimal, precision: 8, scale: 2
  end
end
