class Car < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy

  validates :name, :city, length: { maximum: 10 }
  validates :name, :fuel, :seats, :type, :photo, :price_per_day, :city, presence: true
  validates :price_for_day, numericality: { greater_than_or_equal_to: 0 }
end

