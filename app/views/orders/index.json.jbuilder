json.array!(@orders) do |order|
  json.extract! order, :id, :taxi_id, :user_id, :cost, :distance, :driver_id, :user_phone
  json.url order_url(order, format: :json)
end
