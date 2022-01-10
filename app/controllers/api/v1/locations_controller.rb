class Api::V1::LocationsController < ApplicationController
  def index
    location = LocationsFacade.location_data(params[:ip_address][1..-2])
    render json: LocationSerializer.new(location)
  end
end
