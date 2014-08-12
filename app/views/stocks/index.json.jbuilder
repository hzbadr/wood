json.array!(@stocks) do |stock|
  json.extract! stock, :id, :variant_id, :quantity, :date
  json.url stock_url(stock, format: :json)
end
