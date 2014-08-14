class Report < ActiveRecord::Base
  
  class << self

    def latest_payments
      Payment.order('date DESC').limit(10)
    end

    def latest_orders
      Order.limit(10)
    end

    def latest_customer_payments
      Payment.joins(:customer).limit(10).map(&:customer)
    end

    def top_customers_payments
      Payment.joins(:customer).group('payments.customer_id').select('payments.customer_id, SUM(amount) as total_amount').limit(10)
    end

    def top_payments
    end

    def delayed_customers_payments
    end

    def delayed_orders_payments
    end

    def delayed_suppliers
    end

    def incomin_payments
    end

    def top_products
      LineItem.group('variant_id').select('id, SUM(price) as total_sales').order('total_sales DESC').limit(10)
    end

    def low_products_stock
      LineItem.group('variant_id').select('id, SUM(price) as total_sales').order('total_sales ASC').limit(10)
    end

  end
end
