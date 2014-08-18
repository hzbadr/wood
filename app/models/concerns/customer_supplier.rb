module CustomerSupplier
  extend ActiveSupport::Concern
  
  included do
    has_many :source_transactions, as: :source, class_name: 'Transaction', after_add: :update_source
    has_many :destination_transactions, as: :source, class_name: 'Transaction', after_add: :update_destination

    before_validation :set_user_name, if: ->(u){ u.username.blank? }

      QUERY_SELECT_FIELDS = 'users.id, users.email, users.phone, users.first_name, users.last_name'
      QUERY_ORDER_FIELD = ' SUM(orders.total) as total_amount'
      QUERY_PAYMENT_FIELD = ' SUM(payments.amount) as paid_amount'
      QUERY_REMAINING_FIELD = ' SUM(orders.total - payments.amount) as remaining'

      scope :top_remaining, ->(){ 
                                  select('id, first_name, last_name, SUM(total_amount - total_paid) as total_remaining')
                                  .group('id')
                                  .order('total_remaining DESC')
                                }

      scope :low_remaining, ->(){ 
                                  select('id, first_name, last_name, SUM(total_amount - total_paid) as total_remaining')
                                  .group('id')
                                  .order('total_remaining')
                                }

      scope :top_payments,  ->(){ 
                                select('id, first_name, last_name, SUM(total_paid) as total_payment')
                                .group('id')
                                .order('total_payment DESC')
                              }

      scope :low_payments,  ->(){ 
                                select('id, first_name, last_name, SUM(total_paid) as total_payment')
                                .group('id')
                                .order('total_payment')
                              }

      scope :top_orders,  ->(){
                                joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ') 
                                .select('users.id, users.first_name, users.last_name, SUM(orders.total) as total_amount')
                                .group('users.id')
                                .order('total_amount DESC')
                              }

      scope :low_orders,  ->(){ 
                                joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ') 
                                .select('users.id, users.first_name, users.last_name, SUM(orders.total) as total_amount')
                                .group('users.id')
                                .order('total_amount')
                              }

      
      # scope :with_payments_and_orders, ->(){ joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ')
      #                                          .joins('LEFT OUTER JOIN payments ON payments.user_id = users.id')
      #                                          .select("#{QUERY_SELECT_FIELDS}, #{QUERY_ORDER_FIELD}, #{QUERY_PAYMENT_FIELD}, #{QUERY_REMAINING_FIELD}")
      #                                          .group('users.id') 
      #                                       }
      
      # scope :with_top_remaining, ->(){ with_payments_and_orders.order('remaining DESC') }
      # scope :with_low_remaining, ->(){ with_payments_and_orders.order('remaining') }

      # scope :with_orders, ->(){ joins('LEFT OUTER JOIN orders ON orders.customer_id = users.id ')
      #                             .select("#{QUERY_SELECT_FIELDS}, #{QUERY_ORDER_FIELD}")
      #                             .group('users.id')
      #                           }

      # scope :with_payments, ->(){ joins('LEFT OUTER JOIN payments ON payments.user_id = users.id ')
      #                               .select("#{QUERY_SELECT_FIELDS}, #{QUERY_PAYMENT_FIELD}")
      #                               .group('users.id') 
      #                           }

      # scope :with_top_orders, ->(){ with_orders.order('total_amount DESC') }
      # scope :with_top_payments, ->(){ with_payments.order('paid_amount DESC') }

      # scope :with_low_orders, ->(){ with_orders.order('total_amount') }
      # scope :with_low_payments, ->(){ with_payments.order('paid_amount') }
    
    def password_required?
      false
    end

    def set_user_name
      self.username = "#{full_name}-#{email}-#{('a'..'z').to_a.sample(5).join}"
    end

    def update_source(record)
      update(total_paid: self.total_paid + record.amount) unless record.amount.nil?
    end

    def update_destination(record)
      update(total_paid: self.total_paid - record.amount) unless record.amount.nil?
    end
  end
end