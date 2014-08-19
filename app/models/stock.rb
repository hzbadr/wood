class Stock < ActiveRecord::Base
  belongs_to :product
  belongs_to :warehouse


  def name
    [warehouse.name, product.name].compact.join(' - ')
  end

  def increase_stock_amount(amount)
    update(quantity: quantity + amount)
  end

  def decrease_stock_amount(amount)
    update(quantity: quantity - amount)
  end
end
