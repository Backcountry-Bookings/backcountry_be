class CampsiteFacade 

  def self.get_campsite(camp_id)
    campsite_data = CampsiteService.find_by_camp(camp_id)
    Campsite.new(campsite_data[:data][0])
  end

  def self.get_campsites_by_state(state_code)
    campsite_data = CampsiteService.find_by_state(state_code)
    campsite_data[:data].map do |campsite|
      CampsiteSearch.new(campsite)
    end
  end
end