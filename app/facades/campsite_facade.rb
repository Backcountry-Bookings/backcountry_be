class CampsiteFacade 

  def self.get_campsite(camp_id)
    campsite_data = CampsiteService.find_by_camp(camp_id)
    CampsiteDetails.new(campsite_data[:data][0])
  end

  def self.get_campsites_by_state(state_code)
    campsite_data = CampsiteService.find_by_state(state_code)
    campsite_data[:data].map do |campsite|
      CampsiteSearch.new(campsite)
    end
  end

  def self.get_campsites_by_name(name)
    campsite_data = CampsiteService.find_by_name(name)
    filter = campsite_data[:data].find_all do |campsite|
      campsite[:name].downcase.include?(name.downcase)
    end
    filter.map do |campsite|
      CampsiteSearch.new(campsite)
    end
  end

  def self.get_campsites_by_park(park)
    campsite_data = CampsiteService.find_by_park(park)
    campsite_data[:data].map do |campsite|
      CampsiteSearch.new(campsite)
    end
  end

  def self.get_campsites_by_location(coords)
    format_coords = coords.split(',').map(&:to_f).first(2)
    campsites = Campsite.near([format_coords[0], format_coords[1]], 50).limit(10)
    campsite_ids = campsites.map do |campsite|
      campsite.nps_id
    end
    campsite_data = campsite_ids.map do |id|
      CampsiteService.find_by_name(id)
    end
    camps = campsite_data.map do |campsite|
      CampsiteSearch.new(campsite[:data][0])
    end
  end
end