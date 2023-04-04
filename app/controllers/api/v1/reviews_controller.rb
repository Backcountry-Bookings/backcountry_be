class Api::V1::ReviewsController < ApplicationController
  FILE_VALIDATIONS = {
    content_types: ["image/jpeg", "image/png"],
    max_size: 5.megabytes,
    min_size: 1.kilobyte
  }

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
    
    if params[:img_file].present?
      if (params[:img_file].size > FILE_VALIDATIONS[:max_size]) || (params[:img_file].size < FILE_VALIDATIONS[:min_size])
        render json: { error: "Img file is not given between size" }, status: 400
      elsif review = user.reviews.new(review_params)
        if review.save
          render json: { success: 'Review saved' }, status: 201
        else
          render json: { error: review.errors.full_messages.to_sentence }, status: 400
        end
      end
    
    elsif review = user.reviews.new(review_params)
      if review.save
        render json: { success: 'Review saved' }, status: 201
      else
        render json: { error: review.errors.full_messages.to_sentence }, status: 400
      end
    end
  end

  def destroy 
    if review = Review.find_by(id: params[:id])
      review.destroy
      render json: { success: 'Review deleted successfully' }, status: :ok
    else
      render json: { error: 'Review not found' }, status: :not_found
    end
  end

  private

  def review_params 
    params.permit(:campsite_id, :description, :rating, :site_name, :img_file, :name)
  end
end
