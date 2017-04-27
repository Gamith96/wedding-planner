class WeddingsController < ApplicationController
  before_action :authenticate_user!

  def index
  end
  def show
    id = params[:id]
  end
  def create
  end
  def destroy
  end

end
