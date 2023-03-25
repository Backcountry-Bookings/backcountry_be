class Api::V1::CampsitesController < ApplicationController

  def show 
    campsite = CampsiteFacade.get_campsite(params[:id])
    render json: CampsiteSerializer.new(campsite)
  end
end