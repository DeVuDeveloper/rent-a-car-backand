class AddDropOffCityToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :drop_off_city, :string
  end
end
