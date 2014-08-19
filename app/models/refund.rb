class Refund < Order

  private
    def update_customer_total_amount
      self.customer.decrease_total_amount(self.total)
    end

    def update_warehouse_stock
      self.line_items.map(&:increase_stock_amount)
    end
end
