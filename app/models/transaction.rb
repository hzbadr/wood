class Transaction < ActiveRecord::Base
  belongs_to :safe
  belongs_to :currency

  belongs_to :source, polymorphic: true
  belongs_to :destination, polymorphic: true

  validate :source_is_not_destination

  DESTINATION_TYPES = [ 'Safe', 'Bank', 'Customer', 'Supplier']

  private
    def source_is_not_destination
      errors.add(:source, ' and destination can not be the same!') if source == destination
    end
end
