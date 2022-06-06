require 'rails_helper'

RSpec.describe Car, type: :model do
  before(:each) do
    @user = User.new(id: 4, name: 'Ororogo', email: 'ororogo@gmail.com', password: 'secret123')
    @car = Car.create(user: @user, name: 'Ford', fuel: 'Petrol', seats: 4, navigation: 'GPS', car_type: 'middle',
                      photo: 'photo.jpg', price_for_day: 50, city: 'Berlin')
  end

  it 'if is valid' do
    expect(@car).to be_valid
  end

  it 'if name is blank' do
    @car.name = nil
    expect(@car).to_not be_valid
  end

  it 'should allow valid name' do
    @car.name = 'Apple'
    expect(@car).to be_valid
  end

  it 'if name has more character then allowed' do
    @car.name = 'Ford' * 50
    expect(@car).to_not be_valid
  end

  it 'if price is negative' do
    @car.price_for_day = -50
    expect(@car).to_not be_valid
  end

  it 'if price is valid' do
    @car.price_for_day = 100
    expect(@car).to be_valid
  end

  it 'if photo is blank' do
    @car.photo = nil
    expect(@car).to_not be_valid
  end

  it 'should validate the image link' do
    @car.photo = 'photo.jpg'
    expect(@car).to be_valid
  end

  it 'if there is city' do
    @car.city = 'Berlin'
    expect(@car).to be_valid
  end

  it 'if city has more character then allowed' do
    @car.city = 'Berlin' * 50
    expect(@car).to_not be_valid
  end

  it 'if @car type is blank' do
    @car.car_type = nil
    expect(@car).to_not be_valid
  end

  it 'if there is @car type' do
    @car.car_type = 'middle'
    expect(@car).to be_valid
  end

  it 'if navigation is blank' do
    @car.navigation = nil
    expect(@car).to_not be_valid
  end

  it 'if there are navigation' do
    @car.navigation = 'GSP'
    expect(@car).to be_valid
  end
end
