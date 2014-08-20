class StockTransfer < ActiveRecord::Base
  belongs_to :source, polymorphic: true
  belongs_to :destination, polymorphic: true

  belongs_to :product

  after_create :update_stock

  private
    def update_stock
      stock = if source_type == 'Warehouse'
        Stock.find_or_initialize_by(product_id: product_id, warehouse_id: source_id)
      else
        Stock.find_or_initialize_by(product_id: product_id, warehouse_id: destination_id)  
      end

      if stock.new_record?
        stock.quantity = quantity
        stock.date = date
        stock.save
      else
          if source_type == 'Warehouse'
            stock.update(quantity: stock.quantity - quantity)
          else
            stock.update(quantity: stock.quantity + quantity)
          end
      end
    end
end
