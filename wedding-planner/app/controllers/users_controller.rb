class UsersController < ApplicationController
  def index
    require 'uri'
    require 'net/http'

    url = URI("https://api.yelp.com/v3/businesses/search?term=hotel&location=11211&radius=10000")

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE

    request = Net::HTTP::Get.new(url)
    request["authorization"] = 'Bearer BBr89v-kCWEA95W-USjvDWpmxT0oNUTU3WOk_AIzlzeXbXi565mLiqaViVUDxN-76M01YnskaIppjUs-ufs2oK6UGQ_aBqgCYwnL7k_3XMVAzEGWzOnQiVwvyt0AWXYx'
    request["cache-control"] = 'no-cache'
    request["postman-token"] = '8e478b8a-0733-29e3-7a39-05a2f5284178'

    response = http.request(request)
    puts response.body
    @body = response.body
  end
end
