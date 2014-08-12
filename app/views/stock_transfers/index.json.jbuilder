json.array!(@stock_transfers) do |stock_transfer|
  json.extract! stock_transfer, :id, :source_id, :variant_id, :quantity, :date
  json.url stock_transfer_url(stock_transfer, format: :json)
end
