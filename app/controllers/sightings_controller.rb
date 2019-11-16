class SightingsController < ApplicationController
  def index
    sightings = Sighting.all
    render json: SightingSerializer.new(sightings)
  end
  # def show
  #   sighting = Sighting.find(params[:id])
  #   render json: SightingSerializer.new(sighting)
  # end
  def show
    sighting = Sighting.find_by(id: params[:id])
    options = {
      include: [:bird, :location]
    }
    render json: SightingSerializer.new(sighting, options)
  end 

  #this is ugly...i don't like the repeated data being spit out.
end