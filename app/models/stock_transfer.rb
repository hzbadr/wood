class StockTransfer < ActiveRecord::Base
  belongs_to :source, class_name: 'Supplier'
  belongs_to :product
  belongs_to :warehouse
end
