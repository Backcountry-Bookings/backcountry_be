class Api::V1::ReviewsController < ApplicationController
  # def index
  #   Review.all.each do |review|
  #     if review.id == params[:review_id].to_i
  #       render json: review.images
  #     end
  #   end
  # end

  def create
    # binding.pry
    if User.find_by(id: params[:user_id])
    else
      User.create(name: "Bob", id: 1)
    end

    user = User.find_by(id: params[:user_id])

    review = user.reviews.new(review_params)
    
    if review.save
      render json: { success: 'Review saved' }, status: 201
    else
      render json: { error: 'Review not saved' }, status: 400
    end
    # if Review.find_by(id: params[:review_id])
    # else
    #   Review.create!(campsite_id: params[:campsite_id], user_id: params[:user_id])
    # end
    
    # # review = Review.find_by(id: params[:review_id])
    # review = Review.last
    # # image = Image.create!(image_params)
    # image = review.attach(image_params)
  end

  private

  def review_params 
    params.permit(:campsite_id, :description, :rating, :site_name, images: [])
  end
end
