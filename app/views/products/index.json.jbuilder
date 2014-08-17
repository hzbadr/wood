json.array!(@products) do |product|
  json.extract! product, :id, :weight, :width, :height, :depth, :product_id, :cost_price, :price
  json.url product_url(product, format: :json)
end
