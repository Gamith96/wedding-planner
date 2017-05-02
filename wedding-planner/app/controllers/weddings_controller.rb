class WeddingsController < ApplicationController


  def index
    @wedding = Wedding.find_by(user_id: current_user.id)
    if not @wedding.nil?
      redirect_to('/weddings/' + @wedding.id.to_s)
    else
      require 'uri'
      require 'net/http'

      @weddings = Wedding.where(:user_id => current_user.id)

      url = URI("https://api.yelp.com/v3/businesses/search?term=hotel&location=11211&radius=10000")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["authorization"] = 'Bearer BBr89v-kCWEA95W-USjvDWpmxT0oNUTU3WOk_AIzlzeXbXi565mLiqaViVUDxN-76M01YnskaIppjUs-ufs2oK6UGQ_aBqgCYwnL7k_3XMVAzEGWzOnQiVwvyt0AWXYx'

      response = http.request(request)
      puts response.body
      @body = response.body
    end
  end
  def show
    @wedding = Wedding.find_by(id: params[:id], user_id: current_user.id)
  end
  def create
    require 'uri'
    require 'net/http'

    url = URI("https://api.yelp.com/v3/businesses/" + params[:yelp_id])

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer BBr89v-kCWEA95W-USjvDWpmxT0oNUTU3WOk_AIzlzeXbXi565mLiqaViVUDxN-76M01YnskaIppjUs-ufs2oK6UGQ_aBqgCYwnL7k_3XMVAzEGWzOnQiVwvyt0AWXYx'

    @parsedData = JSON.parse(http.request(request).body)

    @l = Location.find_by(name: @parsedData["name"], url: @parsedData["url"])

    if @l.nil?
      @l = Location.new(
        photo_img: @parsedData["photos"][0],
        url: @parsedData["url"],
        address: @parsedData["location"]["display_address"][0] + " " + @parsedData["location"]["display_address"][1],
        name: @parsedData["name"],
        price: @parsedData["price"].count("$"))
      @l.save
    end

    Wedding.create(couple_name: params[:couple_name],
      wedding_date: params[:date],
      max_budget: params[:max_val],
      min_budget: params[:min_val],
      location_id: @l.id,
      user_id: current_user.id
      )
    redirect_to(:back)
  end
  def destroy
    Wedding.destroy(params[:id])
    redirect_to "/weddings"
  end

end
