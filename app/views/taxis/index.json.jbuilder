json.array!(@taxis) do |taxi|
  json.extract! taxi, :id, :name, :phone, :website, :default_price, :price_for_km, :rank, :description, :city
  json.url taxi_url(taxi, format: :json)
end
