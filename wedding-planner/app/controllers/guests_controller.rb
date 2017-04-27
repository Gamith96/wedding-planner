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
    @guest = Guest.new(params[:name], params[:email], params[:rsvp])

    if @guest.save
        redirect_to '/guests/show', alert: "User created successfully."
    else
        redirect_to 'guests/new', alert: "Error creating user."
    end
  end
end
