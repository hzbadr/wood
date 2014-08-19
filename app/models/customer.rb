class Customer < User
  has_many :orders

  include CustomerSupplier
  
  def increase_total_amount(amount)
    update(total_amount: self.total_amount + amount)
  end

  def decrease_total_amount(amount)
    update(total_amount: self.total_amount - amount)
  end
end
