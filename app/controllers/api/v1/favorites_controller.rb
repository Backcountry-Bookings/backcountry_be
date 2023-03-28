class Api::V1::FavoritesController < ApplicationController

  def create 
    user = User.find(params[:user_id])
    favorite = user.favorites.new(favorite_params)
    if favorite.save
      render json: { success: "Favorite added successfully" }, status: :created
    else 
      render json: { errors: favorite.errors.full_messages.to_sentence }, status: :bad_request
    end
  end

  private

  def favorite_params 
    params.permit(:campsite_name, :campsite_id, :campsite_details, :image)
  end
end