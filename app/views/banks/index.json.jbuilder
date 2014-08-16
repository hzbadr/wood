json.array!(@banks) do |bank|
  json.extract! bank, :id, :name, :type, :account_number
  json.url bank_url(bank, format: :json)
end
