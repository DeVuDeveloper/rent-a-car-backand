class Api::V1::RoomsController < ApplicationController
  before_action :set_car, only: %i[show destroy]

  def index
    @cars = current_user.cars.all
  end

  def create
    @car = current_user.cars.new(car_params)

    if @car.save!
      render :create, status: :created
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @car.destroy
      render json: { message: 'Car has been successfully deleted' }
    else
      render json: @car.errors, status: :unprocessable_entity
    end
  end

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:name, :fuel, :seats, :navigation, :type, :photo, :price_for_day, :city, :user_id)
  end
end
