json.array!(@variants) do |variant|
  json.extract! variant, :id, :weight, :width, :height, :depth, :product_id, :cost_price, :price
  json.url variant_url(variant, format: :json)
end
