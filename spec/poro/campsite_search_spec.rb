require 'rails_helper'

RSpec.describe CampsiteSearch do 
  before :each do 
    WebMock.allow_net_connect!
  end
  
  it 'exists and has attributes' do 
    # binding.pry
    campsites = CampsiteFacade.get_campsites_by_state('CO')
    expect(campsites).to be_an(Array)
    expect(campsites[0]).to be_a(CampsiteSearch)
    expect(campsites[0].name).to eq("Aspenglen Campground")
    expect(campsites[0].id).to eq("7475825B-E844-4012-841B-0E29E05D4540")
    expect(campsites[0].description).to eq("Aspenglen Campground is reservation only. Visit Recreation.gov. Aspenglen opens for the 2023 season on May 26. Timed Entry Permits are included with your camping reservation. For Aspenglen Campers, your reservation includes access to Bear Lake Road. Campers will be able to initially enter the park beginning at 1 p.m. on the first day of your camping reservation. If you plan to enter the park earlier in the day, you will have to enter the park outside of the times when Timed Entry Permits are in effect.")
    expect(campsites[0].images).to be_an(Array)
    expect(campsites[0].images[0][:url]).to eq("https://www.nps.gov/common/uploads/structured_data/3FAA6E89-1DD8-B71B-0B170E56BD4ED00D.jpg")
  end
end