class Product < ActiveRecord::Base
  belongs_to :category
  
  has_many :warehouse, through: :stocks
  has_many :stocks
  has_many :line_items

  validates :category_id, :price, :cost_price, presence: true
  validates :price, :cost_price, :weight, :height, :width, :depth, numericality: true, allow_nil: true

  def name
    "#{category.name} - #{height}x#{width}x#{depth}"
  end
end
