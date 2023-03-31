require "rails_helper"

RSpec.describe "Favorite" do
  describe 'a user can add a favorite campsite' do 
    it 'creates a campsite favorite successfully' do
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body =  { campsite_id: "7475825B-E844-4012-841B-0E29E05D4540" }
      post "/api/v1/favorites?user_id=1", params: body.to_json, headers: headers

      user = User.first

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(user.favorites.empty?).to eq(false)

      response_details = JSON.parse(response.body, symbolize_names: true)

      expect(response_details).to have_key(:success)
      expect(response_details[:success]).to eq("Favorite added successfully")
    end

    it 'does not create a favorite if campsite_id is not present' do
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body =  { campsite_details: "Aspenglen Campground is reservation only. Visit Recreation.gov." }
      post "/api/v1/favorites?user_id=1", params: body.to_json, headers: headers

      user = User.first

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(user.favorites.empty?).to eq(true)

      response_details = JSON.parse(response.body, symbolize_names: true)

      expect(response_details).to have_key(:errors)
      expect(response_details[:errors]).to eq("Campsite can't be blank")
    end
  end

  describe 'Favorites Index', type: :request do
    it 'returns all favorites for a user' do
      user = User.create!(name: "Robert", id: 1)

      Favorite.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", user_id: user.id)
      Favorite.create!(campsite_id: "7ADFe25B-E444-1112-841B-0ABC4367823", user_id: user.id)

      expect(user.favorites.count).to eq(2)

      get "/api/v1/favorites?user_id=1"
    
      favorites = JSON.parse(response.body, symbolize_names: true)

      expect(favorites).to be_a(Hash)
      expect(favorites).to have_key(:data)
      expect(favorites[:data]).to be_an(Array)
      expect(favorites[:data].count).to eq(2)
      expect(favorites[:data].first).to have_key(:id)
      expect(favorites[:data].first[:id]).to be_a(String)
      expect(favorites[:data].first).to have_key(:type)
      expect(favorites[:data].first[:type]).to be_a(String)
      expect(favorites[:data].first).to have_key(:attributes)
      expect(favorites[:data].first[:attributes]).to be_a(Hash)
      expect(favorites[:data].first[:attributes]).to have_key(:campsite_id)
    end

    it 'returns an error if user is not found' do
      get "/api/v1/favorites?user_id=99"

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to be_a(Hash)
      expect(message).to have_key(:errors)
      expect(message[:errors]).to eq("User not found")
    end
  end

  describe 'Favorite Delete', type: :request do
    it 'successfully deletes a favorite' do
      user = User.create!(name: "Robert", id: 1)

      favorite1 = Favorite.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", user_id: user.id)
      favorite2 = Favorite.create!(campsite_id: "7ADFe25B-E444-1112-841B-0ABC4367823", user_id: user.id)

      expect(user.favorites.count).to eq(2)

      delete "/api/v1/favorites/#{favorite1.id}"

      expect(user.favorites.count).to eq(1)
      expect(user.favorites.first).to eq(favorite2)

      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to be_a(Hash)
      expect(message).to have_key(:success)
      expect(message[:success]).to eq("Favorite deleted successfully")
    end

    it 'returns an error if favorite is not found' do
      user = User.create!(name: "Robert", id: 1)

      favorite1 = Favorite.create!(campsite_id: "7475825B-E844-4012-841B-0E29E05D4540",user_id: user.id)
      favorite2 = Favorite.create!(campsite_id: "7ADFe25B-E444-1112-841B-0ABC4367823", user_id: user.id)

      expect(user.favorites.count).to eq(2)

      delete "/api/v1/favorites/99999"

      expect(user.favorites.count).to eq(2)
      
      message = JSON.parse(response.body, symbolize_names: true)

      expect(message).to be_a(Hash)
      expect(message).to have_key(:errors)
      expect(message[:errors]).to eq("Favorite not found")
    end
  end
end