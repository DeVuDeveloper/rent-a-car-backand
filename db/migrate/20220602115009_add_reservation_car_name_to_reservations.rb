class AddReservationCarNameToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :reservation_car_name, :string
  end
end
