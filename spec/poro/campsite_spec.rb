require 'rails_helper'

RSpec.describe Campsite do 
  before :each do 
    WebMock.allow_net_connect!
  end
  
  it 'exists and has attributes' do 
    campsite = CampsiteFacade.get_campsite('7475825B-E844-4012-841B-0E29E05D4540')
  
    expect(campsite).to be_a(Campsite)
    expect(campsite.name).to eq("Aspenglen Campground")
    expect(campsite.id).to eq("7475825B-E844-4012-841B-0E29E05D4540")
    expect(campsite.lat).to eq("40.39934770583215")
    expect(campsite.long).to eq("-105.59305451637942")
    expect(campsite.booking_link).to eq("https://www.recreation.gov/camping/campgrounds/233187")
    expect(campsite.description).to eq("Aspenglen Campground is reservation only. Visit Recreation.gov. Aspenglen opens for the 2023 season on May 26. Timed Entry Permits are included with your camping reservation. For Aspenglen Campers, your reservation includes access to Bear Lake Road. Campers will be able to initially enter the park beginning at 1 p.m. on the first day of your camping reservation. If you plan to enter the park earlier in the day, you will have to enter the park outside of the times when Timed Entry Permits are in effect.")
    expect(campsite.images).to be_a(Array)
    expect(campsite.cost[0][:cost]).to eq("30.00")
    expect(campsite.number_of_reservation_sites).to eq("52")
    expect(campsite.reservation_info).to eq("Aspenglen Campground is a reservation only campground. All sites are reservable up to six months in advance.")
    expect(campsite.toilets).to be_an(Array)
    expect(campsite.toilets[0]).to eq("Flush Toilets - seasonal")
    expect(campsite.showers).to be_an(Array)
    expect(campsite.showers[0]).to eq("None")
    expect(campsite.cell_coverage).to eq("No")
    expect(campsite.laundry).to eq("No")
    expect(campsite.dump_station).to eq("No")
    expect(campsite.camp_store).to eq("No")
    expect(campsite.potable_water).to be_an(Array)
    expect(campsite.potable_water[0]).to eq("Yes - seasonal")
    expect(campsite.ice_available).to eq("Yes - seasonal")
    expect(campsite.firewood_available).to eq("Yes - seasonal")
    expect(campsite.wheelchair_access).to eq("Two ADA sites are offered for those customers with a disability or otherwise limited mobility who would benefit from the accessibility design features.")
    expect(campsite.weather_info).to eq("Average High and Low Temperatures (Fahrenheit): May: 62 / 34 June: 73 / 41 July: 78 / 46 August: 77 / 45 September: 70 / 38")
    expect(campsite.park_code).to eq("romo")
    expect(campsite.park_name).to eq("ROCKY MOUNTAIN")
  end
end