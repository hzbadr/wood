json.array!(@orders) do |order|
  json.extract! order, :id, :number, :total, :state, :customer_id, :completed_at, :created_by_id
  json.url order_url(order, format: :json)
end
