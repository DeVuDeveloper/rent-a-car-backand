json.array! @reservations do |reservation|
  json.id @reservation.id
  json.pick_up_date reservation.check_in
  json.drop_off_date @reservation.check_out
  json.car_id reservation.room_id
  json.user_id reservation.user_id
  json.created_at reservation.created_at
end
