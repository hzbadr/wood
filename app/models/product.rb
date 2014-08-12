class Product < ActiveRecord::Base

  validate :name, presence: true

  
end
