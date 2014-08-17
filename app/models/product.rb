class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :warehouse

  validates :warehouse_id, :category_id, :price, :cost_price, presence: true
  validates :price, :cost_price, :weight, :height, :width, :depth, numericality: true, allow_nil: true

  def name
    "#{category.name} - #{height}x#{width}x#{depth}"
  end

end
