class Payment < ActiveRecord::Base
  belongs_to :order
  belongs_to :customer
  belongs_to :payment_method
end
