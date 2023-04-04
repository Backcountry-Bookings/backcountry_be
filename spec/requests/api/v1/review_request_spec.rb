require 'rails_helper'

RSpec.describe 'Review' do
  before :each do 
    WebMock.allow_net_connect!
  end

  describe 'create a review' do 
    it 'creates a review successfully' do
      user = User.create!(name: "Robert", id: 1)

      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body = { description: 'Was great!', rating: 4, site_name: 'A4' }
      post '/api/v1/reviews?user_id=1&campsite_id=7475825B-E844-4012-841B-0E29E05D4540', params: body.to_json, headers: headers

      expect(response).to be_successful

      success_response = JSON.parse(response.body, symbolize_names: true)
      
      expect(success_response).to be_a(Hash)
      expect(success_response).to have_key(:success)
      expect(success_response[:success]).to eq("Review saved")
    end
  end

  describe 'get all reviews for a campsite' do
    it 'gets all reviews for a campsite' do

      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body = { name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4' }
      post '/api/v1/reviews?user_id=1&campsite_id=7475825B-E844-4012-841B-0E29E05D4540', params: body.to_json, headers: headers

      headers_2 = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body_2 = { name: 'Robert', description: 'Terrible', rating: 0.5, site_name: '23' }
      post '/api/v1/reviews?user_id=1&campsite_id=7475825B-E844-4012-841B-0E29E05D4540', params: body_2.to_json, headers: headers_2

      get "/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540"

      expect(response).to be_successful

      reviews = JSON.parse(response.body, symbolize_names: true)

      expect(reviews).to be_a(Hash)
      expect(reviews).to have_key(:data)
      expect(reviews[:data]).to be_an(Array)
      expect(reviews[:data].count).to eq(2)
      expect(reviews[:data].first).to have_key(:id)
      expect(reviews[:data].first[:id]).to be_a(String)
      expect(reviews[:data].first).to have_key(:type)
      expect(reviews[:data].first[:type]).to be_a(String)
      expect(reviews[:data].first[:type]).to eq("review")
      expect(reviews[:data].first).to have_key(:attributes)
      expect(reviews[:data].first[:attributes]).to be_a(Hash)
      expect(reviews[:data].first[:attributes]).to have_key(:description)
      expect(reviews[:data].first[:attributes][:description]).to be_a(String)
      expect(reviews[:data].first[:attributes]).to have_key(:rating)
      expect(reviews[:data].first[:attributes][:rating]).to be_a(Float)
      expect(reviews[:data].first[:attributes]).to have_key(:site_name)
      expect(reviews[:data].first[:attributes][:site_name]).to be_a(String)
      expect(reviews[:data].first[:attributes]).to have_key(:image_url)
      expect(reviews[:data].first[:attributes][:image_url]).to be_a(String)
      expect(reviews[:data].first[:attributes]).to have_key(:name)
      expect(reviews[:data].first[:attributes][:name]).to be_a(String)
    end 

    it 'returns no image message if image not attached' do 
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body = { name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4' }
      post '/api/v1/reviews?user_id=1&campsite_id=7475825B-E844-4012-841B-0E29E05D4540', params: body.to_json, headers: headers

      get "/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540"

      expect(response).to be_successful

      reviews = JSON.parse(response.body, symbolize_names: true)

      expect(reviews[:data].first[:attributes][:image_url]).to eq("No Image")
    end 

    # xit 'returns url if image stored in aws' do 
    #   file = Rails.root.join('spec', 'fixtures', 'test.jpeg')
    #   image = ActiveStorage::Blob.create_after_upload!(io: File.open(file, 'rb'), filename: 'test.jpeg', content_type: 'image/jpeg').signed_id

    #   headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
    #   body = { name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4', img_file: image }
    #   post '/api/v1/reviews?user_id=1&campsite_id=7475825B-E844-4012-841B-0E29E05D4540', params: body.to_json, headers: headers

    #   get "/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540"

    #   expect(response).to be_successful

    #   reviews = JSON.parse(response.body, symbolize_names: true)

    #   expect(reviews[:data].first[:attributes][:image_url]).to include("https://backcountrybookings.s3.us-west-2.amazonaws.com")
    # end 
  end

  describe 'delete review' do
    it 'successfully deletes a review' do 
      user = User.create!(name: 'Robert', id: 1)

      review1 = Review.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", user_id: user.id, name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4')
      review2 = Review.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", user_id: user.id, name: 'Robert', description: 'Site was too close to water', rating: 2, site_name: 'Z23')

      expect(user.reviews.count).to eq(2)

      get "/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540"

      all_reviews = JSON.parse(response.body, symbolize_names: true)

      expect(all_reviews[:data].count).to eq(2)
      
      delete "/api/v1/reviews/#{review1.id}"

      expect(user.reviews.count).to eq(1)
      expect(user.reviews.first).to eq(review2)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to be_a(Hash)
      expect(message).to have_key(:success)
      expect(message[:success]).to eq("Review deleted successfully")

      get "/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540"

      after_deletion_reviews = JSON.parse(response.body, symbolize_names: true)
      
      expect(after_deletion_reviews[:data].count).to eq(1)
    end

    it 'returns an error if review is not found' do 
      user = User.create!(name: 'Robert', id: 1)

      review1 = Review.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", user_id: user.id, name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4')
      review2 = Review.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", user_id: user.id, name: 'Robert', description: 'Site was too close to water', rating: 2, site_name: 'Z23')

      expect(user.reviews.count).to eq(2)

      delete "/api/v1/reviews/99999999"

      expect(user.reviews.count).to eq(2)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to be_a(Hash)
      expect(message).to have_key(:error)
      expect(message[:error]).to eq("Review not found")
    end
  end

  describe 'sad path' do 
    it 'will return error if no campsite id' do 
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body = { name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4' }
      post '/api/v1/reviews?user_id=1', params: body.to_json, headers: headers

      expect(response).to_not be_successful
      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to be_a(Hash)
      expect(error_response).to have_key(:error)
      expect(error_response[:error]).to eq("Campsite can't be blank")
    end

    it 'will return error if file is not an image' do 
      file = Rails.root.join('spec', 'fixtures', 'test.txt')
      text = ActiveStorage::Blob.create_after_upload!(io: File.open(file, 'rb'), filename: 'test.txt', content_type: 'text/plain').signed_id

      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body = { name: 'Robert', description: 'Was great!', rating: 4, site_name: 'A4', img_file: text }
      post '/api/v1/reviews?user_id=1&campsite_id=7475825B-E844-4012-841B-0E29E05D4540', params: body.to_json, headers: headers

      expect(response).to_not be_successful
      error_response = JSON.parse(response.body, symbolize_names: true)

      expect(error_response).to be_a(Hash)
      expect(error_response).to have_key(:error)
      expect(error_response[:error]).to eq("Img file is not given between size")
    end

    it 'will return an empty array if campsite has no reviews' do 
      get "/api/v1/reviews?campsite_id=7475825B-E844-4012-841B-0E29E05D4540"
      
      expect(response).to be_successful
      reviews = JSON.parse(response.body, symbolize_names: true)

      expect(reviews).to be_a(Hash)
      expect(reviews).to have_key(:data)
      expect(reviews[:data].count).to eq(0)
      expect(reviews[:data]).to eq([])
    end
  end
end