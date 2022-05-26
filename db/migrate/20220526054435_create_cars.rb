class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :fuel
      t.integer :seats
      t.string :navigation
      t.string :type
      t.string :photo
      t.integer :price_for_day
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
