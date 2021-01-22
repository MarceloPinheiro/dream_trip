class DestinationsController < ApplicationController

  before_action :destination_load, only: %i[edit update show]
  before_action :authenticate_user!

  layout "admin"

  def index
    @destinations = Destination.all
  end

  def new
    @destination = Destination.new
  end

  def create
    @destination = Destination.new
    @destination.attributes = destination_params
    save_destination!
  end

  def edit; end

  def update
    @destination.attributes = destination_params
    save_destination!
  end

  def show
  end

  def participants
    @participants = Participant.all().order(name: :asc)
  end

  private
    def destination_load
      @destination = Destination.find(params[:id])
    end

    def destination_params
      params.require(:destination).permit(:id, :place, :image, :description)
    end

    def save_destination!
      @destination.save!
      render :show
    rescue StandardError
      render (params[:action] == "create" ? :new : :edit)
    end
end
