class StockTransfer < ActiveRecord::Base
  belongs_to :source, class_name: 'Supplier'
  belongs_to :product
  belongs_to :warehouse

  after_create :update_stock

  private
    def update_stock
      stock = Stock.find_or_initialize_by(product_id: product_id, warehouse_id: warehouse_id)
      if stock.new_record?
        stock.quantity = quantity
        stock.date = date
        stock.save
      else
        stock.update(quantity: stock.quantity + quantity)
      end
    end
end
