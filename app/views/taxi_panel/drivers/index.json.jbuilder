json.array!(@drivers) do |driver|
  json.extract! driver, :id, :number, :car, :car_naumber, :taxi_id
  json.url driver_url(driver, format: :json)
end
