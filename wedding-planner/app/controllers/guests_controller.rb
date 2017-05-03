class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
    @wedding = Wedding.find_by(id: @guest.wedding_id)

    @location = Location.find_by(id: @wedding.location_id)
    @zip = @location.address.last(5)

    @response = HTTParty.get("http://api.openweathermap.org/data/2.5/weather?zip=" + @zip + "&units=imperial&appid=629364d30da8a324a9929aa07d828b16")
    puts @response.parsed_response
  end
  def new
    @guests = Guest.all
    @guest = Guest.new
  end
  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      GuestMailer.guest_rsvp(@guest[:id], @guest[:email]).deliver
      #GuestMailer.guest_welcome(guest_params[:email]).deliver
        redirect_to "/guests"
    else
        redirect_to(:back)
    end
  end
  def edit
    @guest = Guest.find(params[:id])
    @wedding = Wedding.find_by(id: @guest.wedding_id)
  end
  def update
    @guest = Guest.find(params[:id])
  if @guest.update(guest_params)
    redirect_to @guest
  else
    render 'edit'
  end
end
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end
  def guest_params
      params.require(:guest).permit(:id, :name, :email, :rsvp, :wedding_id)
  end
end
