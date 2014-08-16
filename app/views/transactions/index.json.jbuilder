json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :amount, :source, :destination, :date
  json.url transaction_url(transaction, format: :json)
end
