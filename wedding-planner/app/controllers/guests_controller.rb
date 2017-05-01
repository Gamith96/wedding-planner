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
      GuestMailer.guest_rsvp(@guest[:id], @guest[:email]).deliver
      #GuestMailer.guest_welcome(guest_params[:email]).deliver
        redirect_to "/guests"
    else
        render "new"
    end
  end

  # def rsvp
  #   @guests = Guest.all
  #   @guest = Guest.find(params[:id])
  #   redirect_to edit_guests_path
  # end

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
  def destroy
    @guest = Guest.find(params[:id])
    @guest.destroy
    redirect_to guests_path
  end
  def guest_params
      params.require(:guest).permit(:id, :name, :email, :rsvp, :wedding_id)
  end
end
