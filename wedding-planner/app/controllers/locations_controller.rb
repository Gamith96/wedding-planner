class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def show
    @location = location.find(params[:name])

  end
end
