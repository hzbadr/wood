class Customer < User
  has_many :payments, foreign_key: :user_id
  has_many :orders

  include CustomerSupplier

  QUERY_SELECT_FIELDS = 'users.id, users.email, users.phone, users.first_name, users.last_name, SUM(orders.total) as tatal_amount, 
                        SUM(payments.amount) as paid_amount'
  
  scope :with_payments_and_orders, ->(){ joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ')
                                           .joins('LEFT OUTER JOIN payments ON payments.user_id = users.id')
                                           .select(QUERY_SELECT_FIELDS).group('users.id') 
                                        }
   
end
