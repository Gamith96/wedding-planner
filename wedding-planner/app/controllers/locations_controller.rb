class LocationsController < ApplicationController
  def index
    @locations = Location.all
  end
  def show
    puts "this is the params: #{params}"
    @location = Location.find(params[:id])
    require 'uri'
    require 'net/http'

    url = URI("https://api.yelp.com/v3/businesses/"+@location[:name]+"/reviews")

puts @location[:url]
    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer whtYkTmVUHyjIz44o3xWwEgkC70gb0qSyKgzoeg-gmLO30SDZSIKbpMGzE9ZgWINaSIHSt0hoyfPQTiVOZROW3MSfuJmV--fFwHU98pmpnf9XdJ4_wHNi66bVDkGWXYx'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '2253221e-ba38-e874-f9b2-91659c858523'

    response = http.request(request)
    puts response.body
    @body = response.body
  end
  def new
    @locatoins = Location.all
    @location = Location.new
  end

  def create
      @location= Location.new(location_params)
      if @location.save
        redirect_to (:back)
      else
        render "show"
      end
  end
  def destroy
    Location.destroy(params[:id])
    redirect_to "locations"
  end
  def location_params
        params.require(:location).permit(:id, :name, :address, :price)
  end

end
