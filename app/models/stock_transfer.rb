class StockTransfer < ActiveRecord::Base
  belongs_to :source, class_name: 'Supplier'
  belongs_to :variant
end