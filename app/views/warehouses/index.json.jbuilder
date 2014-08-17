json.array!(@warehouses) do |warehouse|
  json.extract! warehouse, :id, :name, :address, :phone, :size
  json.url warehouse_url(warehouse, format: :json)
end
