class Api::V1::CampsitesController < ApplicationController
  include ParkNameConverter
  def index
    if params[:state_code]
      campsites = CampsiteFacade.get_campsites_by_state(params[:state_code])
    elsif params[:q]
      campsites = CampsiteFacade.get_campsites_by_name(params[:q])
    elsif params[:park_name]
      park_code = convert_to_park_code(params[:park_name].upcase)
      campsites = CampsiteFacade.get_campsites_by_park(park_code)
    end
    if campsites = []
      render json: { errors: "No park found" }, status: :not_found
    else 
      render json: CampsiteSearchSerializer.new(campsites)
    end
  end

  def show 
    campsite = CampsiteFacade.get_campsite(params[:id])
    render json: CampsiteSerializer.new(campsite)
  end
end