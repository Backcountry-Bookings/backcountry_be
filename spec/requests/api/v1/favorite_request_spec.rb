require "rails_helper"

RSpec.describe "Favorite" do
  describe 'a user can add a favorite campsite' do 
    it 'creates a campsite favorite successfully' do 
      user = User.create(name: "Bob", id: 1)

      expect(user.favorites.empty?).to eq(true)

      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body =  { campsite_name: "Aspenglen Campground", campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", campsite_details: "Aspenglen Campground is reservation only. Visit Recreation.gov.", image: "https://www.nps.gov/romo/planyourvisit/agcg.htm" }
      post "/api/v1/users/1/favorites", params: body.to_json, headers: headers

      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(user.favorites.empty?).to eq(false)

      response_details = JSON.parse(response.body, symbolize_names: true)

      expect(response_details).to have_key(:success)
      expect(response_details[:success]).to eq("Favorite added successfully")
    end

    it 'does not create a favorite if campsite_id is not present' do 
      user = User.create(name: "Bob", id: 1)

      expect(user.favorites.empty?).to eq(true)

      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body =  { campsite_name: "Aspenglen Campground", campsite_details: "Aspenglen Campground is reservation only. Visit Recreation.gov.", image: "https://www.nps.gov/romo/planyourvisit/agcg.htm" }
      post "/api/v1/users/1/favorites", params: body.to_json, headers: headers

      expect(response).to_not be_successful
      expect(response.status).to eq(400)
      expect(user.favorites.empty?).to eq(true)

      response_details = JSON.parse(response.body, symbolize_names: true)

      expect(response_details).to have_key(:errors)
      expect(response_details[:errors]).to eq("Campsite can't be blank")
    end
  end
end