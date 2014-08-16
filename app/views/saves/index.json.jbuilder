json.array!(@saves) do |safe|
  json.extract! safe, :id, :name, :type, :account_number
  json.url safe_url(safe, format: :json)
end
