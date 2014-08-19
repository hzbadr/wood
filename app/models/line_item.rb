class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :order, touch: true

  before_validation :set_price_and_cost_price

  validates :special_price, numericality: { greater_than_or_equal_to: 0}, :allow_nil => true

  validate :required_quantity_fulfilled

  def increase_stock_amount
    self.product.increase_stock_amount(quantity)
  end

  def decrease_stock_amount
    self.product.decrease_stock_amount(quantity)
  end

  private
    def set_price_and_cost_price
      self.price = if self.special_price.nil? || self.special_price.zero?
        product.price * self.quantity
      else
        self.special_price * self.quantity
      end

      self.cost_price = product.cost_price
    end

    def required_quantity_fulfilled
      errors.add(:quantity, ' is not enough ro fulfill this product.') if self.product.stock_amount <= self.quantity
    end
end
