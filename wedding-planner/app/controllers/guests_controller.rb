class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end
  def new
    @guest = Guest.new
  end
  def create
    @guest = Guest.new(guest_params)
    if @guest.save
        redirect_to "/guests"
    else
        render "new"
    end
  end
  def guest_params
      params.require(:guest).permit(:name, :email, :rsvp, :wedding_id)
  end
end
