require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = User.new(id: 4, name: 'Ororogo', email: 'ororogo@gmail.com', password: 'secret123')
    @car = Car.create(user: @user, name: 'Ford', fuel: 'Petrol', seats: 4, navigation: 'GPS', car_type: 'middle',
                      photo: 'photo.jpg', price_for_day: 50, city: 'Berlin')

    @reservation = Reservation.create(pick_up_date: '2022-05-30', drop_off_date:
                     '2022-06-05', car_id: @car.id, user_id: @user.id)
  end

  it 'if is valid' do
    expect(@reservation).to be_valid
  end

  it 'if is blank pick up date' do
    @reservation.drop_off_date = nil
    expect(@reservation).to_not be_valid
  end

  it 'if there is drop_off_date' do
    @reservation.drop_off_date = '2022-06-05'
    expect(@reservation).to be_valid
  end
end
