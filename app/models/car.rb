class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :city, length: { maximum: 10 }
  validates :name, :fuel, :seats, :navigation, :car_type, :photo, :price_for_day, presence: true
  validates :price_for_day, numericality: { greater_than_or_equal_to: 0 }
end
