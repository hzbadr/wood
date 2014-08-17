class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order, touch: true

  before_validation :set_price_and_cost_price


  private
    def set_price_and_cost_price
      self.price = product.price * self.quantity
      self.cost_price = product.cost_price
    end

end
