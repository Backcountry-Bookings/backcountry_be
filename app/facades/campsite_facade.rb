class CampsiteFacade 

  def self.get_campsite(camp_id)
    campsite_data = CampsiteService.find_by_camp(camp_id)
    Campsite.new(campsite_data[:data][0])
  end
end