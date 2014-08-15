class Customer < User
  has_many :payments, foreign_key: :user_id
  has_many :orders

  include CustomerSupplier

  QUERY_SELECT_FIELDS = 'users.id, users.email, users.phone, users.first_name, users.last_name'
  QUERY_ORDER_FIELD = ' SUM(orders.total) as total_amount'
  QUERY_PAYMENT_FIELD = ' SUM(payments.amount) as paid_amount'
  QUERY_REMAINING_FIELD = ' SUM(orders.total - payments.amount) as remaining'
  
  scope :with_payments_and_orders, ->(){ joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ')
                                           .joins('LEFT OUTER JOIN payments ON payments.user_id = users.id')
                                           .select("#{QUERY_SELECT_FIELDS}, #{QUERY_ORDER_FIELD}, #{QUERY_PAYMENT_FIELD}, #{QUERY_REMAINING_FIELD}")
                                           .group('users.id') 
                                        }
  
  scope :with_top_remaining, ->(){ with_payments_and_orders.order('remaining DESC') }
  scope :with_low_remaining, ->(){ with_payments_and_orders.order('remaining') }

  scope :with_orders, ->(){ joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ')
                              .select("#{QUERY_SELECT_FIELDS}, #{QUERY_ORDER_FIELD}")
                              .group('users.id')
                            }

  scope :with_payments, ->(){ joins('LEFT OUTER JOIN payments ON payments.user_id = users.id ')
                                .select("#{QUERY_SELECT_FIELDS}, #{QUERY_PAYMENT_FIELD}")
                                .group('users.id') 
                            }

  scope :with_top_orders, ->(){ with_orders.order('total_amount DESC') }
  scope :with_top_payments, ->(){ with_payments.order('paid_amount DESC') }

  scope :with_low_orders, ->(){ with_orders.order('total_amount') }
  scope :with_low_payments, ->(){ with_payments.order('paid_amount') }
   
end
