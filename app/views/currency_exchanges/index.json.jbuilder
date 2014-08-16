json.array!(@currency_exchanges) do |currency_exchange|
  json.extract! currency_exchange, :id, :safe_id, :source_id, :source_amount, :destination_id, :destination_amount, :exchange_rate, :description
  json.url currency_exchange_url(currency_exchange, format: :json)
end
