class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guest = Guest.find(params[:id])
  end
  def new
    @guests = Guest.all
    @guest = Guest.new
  end
  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      GuestMailer.guest_welcome(guest_params[:email]).deliver
        redirect_to(:back)
    else
        redirect_to(:back)
    end
  end
  def edit
    @guest = Guest.find(params[:id])
  end
  def update
  @guest = Guest.find(params[:id])
  if @guest.update(guest_params)
    redirect_to @guest
  else
    render 'edit'
  end
end
  # def update
  #   @guest = Guest.find_by(id: params[:id])
  #   @guest.update(name: params[:name],
  #     email: params[:email],
  #     rsvp: params[:rsvp])
  #   redirect_to "/guests"
  # end
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end
  def guest_params
      params.require(:guest).permit(:name, :email, :rsvp, :wedding_id)
  end
end
