class Api::V1::CarsController < ApplicationController
  before_action :set_car, only: %i[show destroy]

  def index
    @cars = Car.all
    render json: @cars, status: 200
  end

  def show
    @car = Car.find(params[:id])
    render json: @car, status: 200
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
    params.require(:car).permit(:name, :fuel, :seats, :navigation, :car_type, :photo, :price_for_day, :city, :user_id)
  end
end
