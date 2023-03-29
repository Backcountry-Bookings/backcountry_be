require 'rails_helper'

RSpec.describe 'campsite service' do
  before :each do
    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?q=7475825B-E844-4012-841B-0E29E05D4540&api_key=#{ENV['NPS_API_KEY']}&limit=1")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsite_details.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&stateCode=CO")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_state.json'), headers: {})

    stub_request(:get, "https://developer.nps.gov/api/v1/campgrounds?api_key=#{ENV['NPS_API_KEY']}&parkCode=olym")
      .to_return(status: 200, body: File.read('./spec/fixtures/campsites_search_by_park.json'), headers: {})
  end

  it 'can return the searched campsite' do 
    response = CampsiteService.find_by_camp('7475825B-E844-4012-841B-0E29E05D4540')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:limit)
    expect(response[:limit]).to eq("1")
    expect(response).to have_key(:data)
    expect(response[:data]).to be_a(Array)
    expect(response[:data][0]).to have_key(:id)
    expect(response[:data][0]).to have_key(:url)
    expect(response[:data][0]).to have_key(:name)
    expect(response[:data][0]).to have_key(:latitude)
    expect(response[:data][0]).to have_key(:latLong)
    expect(response[:data][0]).to have_key(:reservationInfo)
    expect(response[:data][0]).to have_key(:amenities)
    expect(response[:data][0][:amenities]).to have_key(:toilets)
    expect(response[:data][0][:amenities]).to have_key(:laundry)
    expect(response[:data][0][:amenities]).to have_key(:foodStorageLockers)
    expect(response[:data][0]).to have_key(:operatingHours)
    expect(response[:data][0]).to have_key(:addresses)
    expect(response[:data][0][:addresses]).to be_a(Array)
    expect(response[:data][0]).to have_key(:images)
    expect(response[:data][0][:images]).to be_a(Array)
    expect(response[:data][0]).to have_key(:weatherOverview)
  end

  it 'returns a list of campsites by state' do
    response = CampsiteService.find_by_state('CO')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:total)
    expect(response[:total]).to eq("30")
    expect(response).to have_key(:data)
    expect(response[:data]).to be_a(Array)
    expect(response[:data][0]).to have_key(:id)
    expect(response[:data][0]).to have_key(:url)
    expect(response[:data][0]).to have_key(:name)
    expect(response[:data][0]).to have_key(:latitude)
    expect(response[:data][0]).to have_key(:latLong)
    expect(response[:data][0]).to have_key(:reservationInfo)
    expect(response[:data][0]).to have_key(:amenities)
    expect(response[:data][0][:amenities]).to have_key(:toilets)
    expect(response[:data][0][:amenities]).to have_key(:laundry)
    expect(response[:data][0][:amenities]).to have_key(:foodStorageLockers)
    expect(response[:data][0]).to have_key(:operatingHours)
    expect(response[:data][0]).to have_key(:addresses)
    expect(response[:data][0][:addresses]).to be_a(Array)
    expect(response[:data][0]).to have_key(:images)
    expect(response[:data][0][:images]).to be_a(Array)
    expect(response[:data][0]).to have_key(:weatherOverview)
    expect(response[:data][0]).to have_key(:addresses)
    expect(response[:data][0][:addresses]).to be_a(Array)
    expect(response[:data][0][:addresses][0]).to have_key(:stateCode)
    expect(response[:data][0][:addresses][0][:stateCode]).to eq("CO")
  end

  it 'returns a list of campsites by by park' do
    response = CampsiteService.find_by_park('olym')

    expect(response).to be_a(Hash)
    expect(response).to have_key(:total)
    expect(response[:total]).to eq("12")
    expect(response).to have_key(:data)
    expect(response[:data]).to be_a(Array)
    expect(response[:data][0]).to have_key(:id)
    expect(response[:data][0]).to have_key(:url)
    expect(response[:data][0]).to have_key(:name)
    expect(response[:data][0]).to have_key(:latitude)
    expect(response[:data][0]).to have_key(:latLong)
    expect(response[:data][0]).to have_key(:reservationInfo)
    expect(response[:data][0]).to have_key(:amenities)
    expect(response[:data][0][:amenities]).to have_key(:toilets)
    expect(response[:data][0][:amenities]).to have_key(:laundry)
    expect(response[:data][0][:amenities]).to have_key(:foodStorageLockers)
    expect(response[:data][0]).to have_key(:operatingHours)
    expect(response[:data][0]).to have_key(:addresses)
    expect(response[:data][0][:addresses]).to be_a(Array)
    expect(response[:data][0]).to have_key(:images)
    expect(response[:data][0][:images]).to be_a(Array)
    expect(response[:data][0]).to have_key(:weatherOverview)
    expect(response[:data][0]).to have_key(:addresses)
    expect(response[:data][0][:addresses]).to be_a(Array)
    expect(response[:data][0][:addresses][0]).to have_key(:stateCode)
    expect(response[:data][0][:addresses][0][:stateCode]).to eq("WA")
  end
end