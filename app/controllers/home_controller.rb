class HomeController < ApplicationController

  def index
    @top_paying_customers = Customer.top_payments.limit(10)
    @top_ordering_customers = Customer.top_orders.limit(10)
    @top_remaining_customers = Customer.top_remaining.limit(10)

    @low_paying_customers = Customer.low_payments.limit(10)
    @low_ordering_customers = Customer.low_orders.limit(10)
    @low_remaining_customers = Customer.low_remaining.limit(10)
  end
end
