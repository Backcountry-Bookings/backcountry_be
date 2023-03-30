class Campsite 
  include ParkNameConverter

  attr_reader :name,
              :id,
              :lat,
              :long,
              :booking_link,
              :description,
              :images,
              :cost,
              :number_of_reservation_sites,
              :reservation_info,
              :toilets,
              :showers,
              :cell_coverage,
              :laundry,
              :dump_station,
              :camp_store,
              :potable_water,
              :ice_available,
              :firewood_available,
              :wheelchair_access,
              :weather_info,
              :park_code

  def initialize(camp_data)
    @name = camp_data[:name]
    @id = camp_data[:id]
    @lat = camp_data[:latitude]
    @long = camp_data[:longitude]
    @booking_link = camp_data[:reservationUrl]
    @description = camp_data[:description]
    @images = camp_data[:images] #may need additional method
    @cost = camp_data[:fees] #may need adjustment
    @number_of_reservation_sites = camp_data[:campsites][:totalSites]
    @reservation_info = camp_data[:reservationInfo]
    @toilets = camp_data[:amenities][:toilets]
    @showers = camp_data[:amenities][:showers]
    @cell_coverage = camp_data[:amenities][:cellPhoneReception]
    @laundry = camp_data[:amenities][:laundry]
    @dump_station = camp_data[:amenities][:dumpStation]
    @camp_store = camp_data[:amenities][:campStore]
    @potable_water = camp_data[:amenities][:potableWater]
    @ice_available = camp_data[:amenities][:iceAvailableForSale]
    @firewood_available = camp_data[:amenities][:firewoodForSale]
    @wheelchair_access = camp_data[:accessibility][:wheelchairAccess]
    @weather_info = camp_data[:weatherOverview]
    @park_code = camp_data[:parkCode]
  end

  def park_name
    convert_to_park_name(park_code.upcase)
  end
end