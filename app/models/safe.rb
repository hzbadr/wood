class Safe < ActiveRecord::Base

  has_many :source_transactions, as: :source, class_name: 'Transaction'
  has_many :destination_transactions, as: :destination, class_name: 'Transaction'

  before_save :set_type

  scope :safe_only, ->(){where(type: 'Safe')}

  def increase_amount(amount, source, currency_id)
    source_transactions.create(source: source, destination: self, amount: amount, currency_id: currency_id)
  end

  def descrease_amount(amount, destination, currency_id)
    destination_transactions.create(source: self, destination: destination, amount: amount, currency_id: currency_id)
  end

  def balance
    source_transactions.pluck(:amount).sum - destination_transactions.pluck(:amount).sum
  end

  def set_type
    self.type = 'Safe' if type.nil?   
  end
end
