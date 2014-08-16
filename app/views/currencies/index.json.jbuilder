json.array!(@currencies) do |currency|
  json.extract! currency, :id, :name, :sign
  json.url currency_url(currency, format: :json)
end
