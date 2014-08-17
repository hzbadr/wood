class Customer < User
  has_many :orders

  include CustomerSupplier
   
end
