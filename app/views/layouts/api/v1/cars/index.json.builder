json.array! @cars do |car|
  json.id car.id
  json.name car.name
  json.fuel car.fuel
  json.seats car.seats
  json.navigation car.navigation
  json.type car.type
  json.photo car.photo
  json.price_for_day car.price_for_day
  json.city car.city
  json.created_at car.created_at
end
