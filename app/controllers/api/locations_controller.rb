class Api::LocationsController < ApplicationController

  before_filter :parse_locations, only: :create

  def create
    render json: { saved: false } and return unless @locations

    @device = Device.find(params[:device_id])

    @device.device_locations << @locations.map do |location|
      DeviceLocation.new(location)
    end

    render json: { saved: true }
  end

  private

  def parse_locations
    @locations ||= params[:location].split(';').map do |location|
      Hash[ *location.split('/') ]
    end if params[:location]
  end

end
