class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def show
    @guests = Guest.find(params[:id])
  end

  def create
    @guest = Guest.new(params[:name], params[:email], params[:rsvp])

    if @guest.save
        redirect_to @guest, alert: "User created successfully."
    else
        redirect_to new_user_path, alert: "Error creating user."
    end
  end

  def new
    # @guest = Guest.new
  end
end
