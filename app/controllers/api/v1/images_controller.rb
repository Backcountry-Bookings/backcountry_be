class Api::V1::ImagesController < ApplicationController
  def index
    Review.all.each do |review|
      if review.id == params[:review_id].to_i
        render json: review.images
      end
    end
  end

  def create
    image = Image.new(image_params)
    if image.save
      render json: image
    else
      render json: { error: 'Image not saved' }, status: 400
    end
  end

  private

  def image_params 
    params.permit(:review_id, :img_file)
  end
end