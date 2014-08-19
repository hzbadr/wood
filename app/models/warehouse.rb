class Warehouse < ActiveRecord::Base
  has_many :products, through: :stocks
  has_many :stocks
end
