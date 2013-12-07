json.array!(@places) do |place|
  json.extract! place, :id, :city, :street, :house, :order_id
  json.url place_url(place, format: :json)
end
