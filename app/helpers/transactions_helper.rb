module TransactionsHelper

  def destination_types(source)
    if ['Supplier', 'Customer'].include?(source.class.name)
      Transaction::DESTINATION_TYPES - ['Supplier', 'Customer']
    else
      Transaction::DESTINATION_TYPES
    end
  end
end
