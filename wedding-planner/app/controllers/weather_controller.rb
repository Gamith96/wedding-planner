class WeatherController < ApplicationController
  def index
    @location = "new york"
    @response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?q=" + @location + "&units=imperial&appid=629364d30da8a324a9929aa07d828b16")
    puts @response.parsed_response
  end
end
