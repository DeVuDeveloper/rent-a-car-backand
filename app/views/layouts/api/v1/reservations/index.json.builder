json.array! @reservations do |reservation|
  json.id @reservation.id
  json.pick_up_date reservation.pick_up_date
  json.drop_off_date reservation.drop_off_date
  json.pick_up_city reservation.pick_up_city
  json.return_city reservation.return_city
  json.car_id reservation.car_id
  json.user_id reservation.user_id
  json.created_at reservation.created_at
end
