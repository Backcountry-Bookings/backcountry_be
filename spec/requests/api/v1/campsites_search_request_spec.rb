require 'rails_helper'

RSpec.describe 'CampsitesSearch API' do
  before :each do
    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&stateCode=CO")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_state.json'), headers: {})
  
    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&q=Rocky")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_name.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&parkCode=OLYM")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_park.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&parkCode=")
      .to_return(status: 200, body: File.read('./spec/fixtures/not_a_park.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&stateCode=AB")
      .to_return(status: 200, body: File.read('./spec/fixtures/not_a_park.json'), headers: {})
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
        expect(campsite[:attributes]).to have_key(:description)
        expect(campsite[:attributes]).to have_key(:images)
        expect(campsite[:attributes][:images]).to be_an(Array)
        expect(campsite[:attributes]).to have_key(:cost)
      end
    end
  end

  describe '#get_campsites_by_name' do
    it 'returns the campsites by name' do
      get '/api/v1/campsites?q=Rocky'

      expect(response).to be_successful

      campsite_details = JSON.parse(response.body, symbolize_names: true)

      expect(campsite_details).to be_a(Hash)
      expect(campsite_details).to have_key(:data)
      expect(campsite_details[:data]).to be_an(Array)
      expect(campsite_details[:data].count).to eq(2)
      
      campsite_details[:data].each do |campsite|
        expect(campsite).to have_key(:id)
        expect(campsite).to have_key(:type)
        expect(campsite[:type]).to eq('campsite_search')
        expect(campsite).to have_key(:attributes)
        expect(campsite[:attributes]).to be_a(Hash)
        expect(campsite[:attributes]).to have_key(:name)
        expect(campsite[:attributes]).to have_key(:description)
        expect(campsite[:attributes]).to have_key(:images)
        expect(campsite[:attributes][:images]).to be_an(Array)
        expect(campsite[:attributes]).to have_key(:cost)

      end
    end
  end

  describe '#get_campsites_by_park' do
    it 'returns the campsites by park' do
      get '/api/v1/campsites?park_name=olympic'

      expect(response).to be_successful

      campsite_details = JSON.parse(response.body, symbolize_names: true)

      expect(campsite_details).to be_a(Hash)
      expect(campsite_details).to have_key(:data)
      expect(campsite_details[:data]).to be_an(Array)
      expect(campsite_details[:data].count).to eq(12)
      
      campsite_details[:data].each do |campsite|
        expect(campsite).to have_key(:id)
        expect(campsite).to have_key(:type)
        expect(campsite[:type]).to eq('campsite_search')
        expect(campsite).to have_key(:attributes)
        expect(campsite[:attributes]).to be_a(Hash)
        expect(campsite[:attributes]).to have_key(:name)
        expect(campsite[:attributes]).to have_key(:description)
        expect(campsite[:attributes]).to have_key(:images)
        expect(campsite[:attributes][:images]).to be_an(Array)
        expect(campsite[:attributes]).to have_key(:cost)

      end
    end
  
    it 'returns an error when a park name is not found' do
      get '/api/v1/campsites?park_name=CDIM'

      campsite_details = JSON.parse(response.body, symbolize_names: true)

      expect(campsite_details).to have_key(:errors)
      expect(campsite_details[:errors]).to eq('No park found')
    end

    it 'returns an error when a state code is not found' do
      get '/api/v1/campsites?state_code=AB'

      campsite_details = JSON.parse(response.body, symbolize_names: true)

      expect(campsite_details).to have_key(:errors)
      expect(campsite_details[:errors]).to eq('No state found')
    end
  end

end