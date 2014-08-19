json.array!(@refunds) do |refund|
  json.extract! refund, :id, :number, :total, :state, :customer_id, :completed_at, :created_by_id
  json.url refund_url(refund, format: :json)
end
