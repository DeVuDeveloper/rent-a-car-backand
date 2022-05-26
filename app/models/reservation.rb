class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :car

  validates :pick_up_date, :drop_off_date, presence: true
end
