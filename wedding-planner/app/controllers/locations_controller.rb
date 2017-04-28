class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def show
    puts "this is the params: #{params}"
    @location = Location.find(params[:name])
  end

  # def create
  #   @location = Locations.new(location_params)
  #     if @location.save
  #       redirect_to location_index_path
  #     else
  #       render "show"
  #     end
  #   end

end
