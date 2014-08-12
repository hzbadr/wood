class Variant < ActiveRecord::Base
  belongs_to :product

  validates :product, :price, :cost_price, presence: true
  validates :price, :cost_price, :weight, :height, :width, :depth, numericality: true, allow_nil: true
end
