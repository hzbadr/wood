class LineItem < ActiveRecord::Base
  belongs_to :variant
  belongs_to :order

  before_validation :set_price_and_cost_price


  private
    def set_price_and_cost_price
      self.price = variant.price * self.quantity
      self.cost_price = variant.cost_price
    end

end
