require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.new(name: 'Ororogo', email: 'ororogo@gmail.com', password: 'secret123')
  end

  it 'name should not be nil' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'should valid the name' do
    @user.name = 'Ororogo'
    expect(@user).to be_valid
  end

  it 'should not be greater than 20' do
    @user.name = 'Ororogo' * 20
    expect(@user).to_not be_valid
  end
end
