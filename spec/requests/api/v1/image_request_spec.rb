require "rails_helper"

RSpec.describe "Images" do
  describe 'a user can add a' do 
    it 'creates a campsite favorite successfully' do
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      body =  { campsite_name: "Aspenglen Campground", campsite_id: "7475825B-E844-4012-841B-0E29E05D4540", campsite_details: "Aspenglen Campground is reservation only. Visit Recreation.gov.", image: "https://www.nps.gov/romo/planyourvisit/agcg.htm" }
      post "/api/v1/favorites?user_id=1", params: body.to_json, headers: headers
    end
  end
end