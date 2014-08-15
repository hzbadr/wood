json.array!(@payments) do |payment|
  json.extract! payment, :id, :amount, :order_id, :customer_id, :state, :payment_method_id
  json.url payment_url(payment, format: :json)
end
