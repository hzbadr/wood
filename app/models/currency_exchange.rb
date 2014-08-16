class CurrencyExchange < ActiveRecord::Base
  belongs_to :safe
  belongs_to :source, class_name: 'Currency'
  belongs_to :destination, class_name: 'Currency'
end
