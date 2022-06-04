class RemoveReservationCarNameFromReservations < ActiveRecord::Migration[7.0]
  def change
    remove_column :reservations, :reservation_car_name, :string
  end
end
