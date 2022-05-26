class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :city, length: { maximum: 10 }
  validates :name, :fuel, :seats, :navigation, :car_type, :photo, :price_for_day, :city, presence: true

end
