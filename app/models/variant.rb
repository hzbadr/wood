class Variant < ActiveRecord::Base
  belongs_to :product

  validate :product, :price, :cost_price, presence: true
end
