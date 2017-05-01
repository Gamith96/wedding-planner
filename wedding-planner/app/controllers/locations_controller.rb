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

  # def create
  #   @location = Locations.new(location_params)
  #     if @location.save
  #       redirect_to location_index_path
  #     else
  #       render "show"
  #     end
  #   end

end
