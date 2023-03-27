require 'rails_helper'

RSpec.describe 'campsite facade' do 
  before :each do 
    WebMock.allow_net_connect!
  end
  
  describe 'get_campsite' do 
    it 'gets the details of the campsite object' do 
      campsite = CampsiteFacade.get_campsite('7475825B-E844-4012-841B-0E29E05D4540')
      
      expect(campsite).to be_a(Campsite)
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
end