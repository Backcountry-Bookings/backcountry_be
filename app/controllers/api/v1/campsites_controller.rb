class Api::V1::CampsitesController < ApplicationController
  include ParkNameConverter
  def index
    if params[:state_code]
      campsites = CampsiteFacade.get_campsites_by_state(params[:state_code])
      render json: CampsiteSearchSerializer.new(campsites)

    elsif params[:q]
      campsites = CampsiteFacade.get_campsites_by_name(params[:q])
      render json: CampsiteSearchSerializer.new(campsites)

    elsif params[:park_name]
      park_code = convert_to_park_code(params[:park_name].upcase)
      campsites = CampsiteFacade.get_campsites_by_park(park_code)
      render json: CampsiteSearchSerializer.new(campsites)

    elsif params[:by_dist]
      campsites = CampsiteFacade.get_campsites_by_location(params[:by_dist])
      # binding.pry
      render json: CampsiteLocationSerializer.location_serializer(campsites)
    end
  end

  def show 
    campsite = CampsiteFacade.get_campsite(params[:id])
    render json: CampsiteSerializer.new(campsite)
  end
end