class RenameTypeInCars < ActiveRecord::Migration[7.0]
  def change
    rename_column :cars, :type, :car_type
  end
end
