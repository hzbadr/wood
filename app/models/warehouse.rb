class Warehouse < ActiveRecord::Base
  has_many :products, through: :stocks
  has_many :stocks
  
  DANGER_SIZE, WARNING_SIZE, SAFE_SIZE = [90, 70, 50]

  def stock_size_percentage
    (size - stocks.select('SUM(quantity) as total_quantity').first.total_quantity)  * 100 / size
  end
end
