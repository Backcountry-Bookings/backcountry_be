class Api::V1::ReviewsController < ApplicationController
  def index
    if reviews = Review.all.find_all{ |review| review.campsite_id == params[:campsite_id] }
      render json: ReviewSerializer.new(reviews)
    end
  end

  def create
    if User.find_by(id: params[:user_id])
    else
      User.create(name: "Bob", id: 1)
    end
    
    user = User.find_by(id: params[:user_id])
    
    review = user.reviews.new(review_params)
    
    if review.save
      render json: { success: 'Review saved' }, status: 201
    else
      render json: { error: review.errors.full_messages.to_sentence }, status: 400
    end
  end

  private

  def review_params 
    params.permit(:campsite_id, :description, :rating, :site_name, :img_file)
  end
end
