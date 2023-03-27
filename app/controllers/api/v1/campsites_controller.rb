class Api::V1::CampsitesController < ApplicationController
  include ParkNameConverter
  def index
    if params[:state_code]
      campsites = CampsiteFacade.get_campsites_by_state(params[:state_code])
    elsif params[:q]
      campsites = CampsiteFacade.get_campsites_by_name(params[:q])
    elsif params[:park_name]
      park_code = convert_to_park_code(params[:park_name].downcase)
      campsites = CampsiteFacade.get_campsites_by_park(park_code)
    end
    render json: CampsiteSearchSerializer.new(campsites)
  end

  def show 
    campsite = CampsiteFacade.get_campsite(params[:id])
    render json: CampsiteSerializer.new(campsite)
  end
end