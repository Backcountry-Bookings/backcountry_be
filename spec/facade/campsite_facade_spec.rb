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
end