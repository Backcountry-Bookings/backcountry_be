require 'rails_helper'

RSpec.describe 'Campsite API' do
  before :each do
    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?q=7475825B-E844-4012-841B-0E29E05D4540&api_key=#{ENV['NPS_API_KEY']}&limit=1")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsite_details.json'), headers: {})
  end

  describe 'get campsite details' do
    it 'can return the campsite details' do 
      get '/api/v1/campsites/7475825B-E844-4012-841B-0E29E05D4540'

      expect(response).to be_successful

      campsite_details = JSON.parse(response.body, symbolize_names: true)

      expect(campsite_details).to be_a(Hash)
      expect(campsite_details).to have_key(:data)
      expect(campsite_details[:data]).to be_a(Hash)
      expect(campsite_details[:data]).to have_key(:id)
      expect(campsite_details[:data]).to have_key(:type)
      expect(campsite_details[:data][:type]).to eq("campsite")
      expect(campsite_details[:data]).to have_key(:attributes)
      expect(campsite_details[:data][:attributes]).to have_key(:name)
      expect(campsite_details[:data][:attributes]).to have_key(:lat)
      expect(campsite_details[:data][:attributes]).to have_key(:long)
      expect(campsite_details[:data][:attributes]).to have_key(:booking_link)
      expect(campsite_details[:data][:attributes]).to have_key(:description)
      expect(campsite_details[:data][:attributes]).to have_key(:images)
      expect(campsite_details[:data][:attributes]).to have_key(:cost)
      expect(campsite_details[:data][:attributes]).to have_key(:number_of_reservation_sites)
      expect(campsite_details[:data][:attributes]).to have_key(:reservation_info)
      expect(campsite_details[:data][:attributes]).to have_key(:toilets)
      expect(campsite_details[:data][:attributes]).to have_key(:showers)
      expect(campsite_details[:data][:attributes]).to have_key(:cell_coverage)
      expect(campsite_details[:data][:attributes]).to have_key(:laundry)
      expect(campsite_details[:data][:attributes]).to have_key(:dump_station)
      expect(campsite_details[:data][:attributes]).to have_key(:camp_store)
      expect(campsite_details[:data][:attributes]).to have_key(:potable_water)
      expect(campsite_details[:data][:attributes]).to have_key(:ice_available)
      expect(campsite_details[:data][:attributes]).to have_key(:firewood_available)
      expect(campsite_details[:data][:attributes]).to have_key(:wheelchair_access)
      expect(campsite_details[:data][:attributes]).to have_key(:weather_info)
    end
  end
end