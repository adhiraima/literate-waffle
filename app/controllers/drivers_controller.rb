class DriversController < ApplicationController
  before_action :driver, only: [:update_position]
  def list
    render json: Driver.drivers_in_range(latitude, longitude, radius, limit)
  end

  def update_position
    render json: { message: 'Driver not found' }, status: :not_found if @driver.nil?
    if driver.update(latitude: latitude, longitude: longitude)
      render json: {}
    else
      render json: { errors: driver.errors }, status: :unprocessable_entry
    end
  end

  private

  def latitude
    params[:latitude]
  end

  def longitude
    params[:longitude]
  end

  def accuracy
    params[:accuracy]
  end

  def radius
    return 500 if params[:radius].nil?
    params[:radius].to_i
  end

  def limit
    return 10 if params[:limit].nil?
    params[:limit].to_i
  end

  def driver
    @driver ||= Driver.find_by(id, params[:id])
  end
end
