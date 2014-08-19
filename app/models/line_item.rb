class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :stock
  belongs_to :order, touch: true

  before_validation :set_product
  before_validation :set_price_and_cost_price

  validates :special_price, numericality: { greater_than_or_equal_to: 0}, :allow_nil => true

  validate :required_quantity_fulfilled


  def increase_stock_amount
    self.stock.increase_stock_amount(quantity)
  end

  def decrease_stock_amount
    self.stock.decrease_stock_amount(quantity)
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
      errors.add(:quantity, ' is not enough ro fulfill this product.') if self.stock.quantity <= self.quantity
    end

    def set_product
      self.product_id = self.stock.product_id
    end
end
