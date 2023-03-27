require 'rails_helper'

RSpec.describe 'CampsitesSearch API' do
  before :each do
    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&stateCode=CO")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_state.json'), headers: {})
  end

  describe 'return list of campsites by state' do
    it 'returns campsites' do 
      get '/api/v1/campsites?state_code=CO'

      expect(response).to be_successful

      campsite_details = JSON.parse(response.body, symbolize_names: true)

      expect(campsite_details).to be_a(Hash)
      expect(campsite_details).to have_key(:data)
      expect(campsite_details[:data]).to be_an(Array)
      
      campsite_details[:data].each do |campsite|
        expect(campsite).to have_key(:id)
        expect(campsite).to have_key(:type)
        expect(campsite[:type]).to eq('campsite_search')
        expect(campsite).to have_key(:attributes)
        expect(campsite[:attributes]).to be_a(Hash)
        expect(campsite[:attributes]).to have_key(:name)
        expect(campsite[:attributes]).to have_key(:id)
        expect(campsite[:attributes]).to have_key(:description)
        expect(campsite[:attributes]).to have_key(:images)
        expect(campsite[:attributes][:images]).to be_an(Array)
      end
    end
  end
end