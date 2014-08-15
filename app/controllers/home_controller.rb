class HomeController < ApplicationController

  def index
    @top_paying_customers = Customer.with_top_payments.limit(10)
    @top_ordering_customers = Customer.with_top_orders.limit(10)
    @top_remaining_customers = Customer.with_top_remaining.limit(10)

    @low_paying_customers = Customer.with_low_payments.limit(10)
    @low_ordering_customers = Customer.with_low_orders.limit(10)
    @low_remaining_customers = Customer.with_low_remaining.limit(10)


  end
end
