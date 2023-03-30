class CampsiteSerializer
  include JSONAPI::Serializer

  attributes :name, :lat, :long, :booking_link, :description, :images, :cost, :number_of_reservation_sites, :reservation_info, :toilets, :showers, :cell_coverage, :laundry, :dump_station, :camp_store, :potable_water, :ice_available, :firewood_available, :wheelchair_access, :weather_info
end