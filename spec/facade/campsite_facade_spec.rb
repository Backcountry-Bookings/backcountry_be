require 'rails_helper'

RSpec.describe 'campsite facade' do 
  before :each do 
    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&q=7475825B-E844-4012-841B-0E29E05D4540&limit=1")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsite_details.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&stateCode=CO")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_state.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&q=Rocky")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_name.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&parkCode=OLYM")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_park.json'), headers: {})
  end
  
  describe 'get_campsite' do 
    it 'gets the details of the campsite object' do 
      campsite = CampsiteFacade.get_campsite('7475825B-E844-4012-841B-0E29E05D4540')
      
      expect(campsite).to be_a(CampsiteDetails)
    end
  end

  describe '#get_campsites_by_state' do
    it 'gets the campsites by state' do
      campsites = CampsiteFacade.get_campsites_by_state('CO')

      expect(campsites).to be_a(Array)

      campsites.each do |campsite|
        expect(campsite).to be_a(CampsiteSearch)
      end
    end
  end

  describe '#get_campsites_by_name' do
    it 'returns the campsites by name' do
      campsites = CampsiteFacade.get_campsites_by_name('Rocky')
      expect(campsites).to be_a(Array)

      campsites.each do |campsite|
        expect(campsite).to be_a(CampsiteSearch)
      end
    end
  end

  describe '#get_campsites_by_park' do
    it 'returns the campsites by park name' do
      campsites = CampsiteFacade.get_campsites_by_park('OLYM')
      expect(campsites).to be_a(Array)

      campsites.each do |campsite|
        expect(campsite).to be_a(CampsiteSearch)
      end
    end
  end
end