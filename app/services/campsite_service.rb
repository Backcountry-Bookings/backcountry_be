class CampsiteService

  def self.find_by_camp(camp_id)
    parse(conn.get("/api/v1/campgrounds?q=#{camp_id}&limit=1"))
  end

  def self.campsite_search_by_state(state_code)
    parse(conn.get("/api/v1/campgrounds?stateCode=#{state_code}"))
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn 
    Faraday.new(url: 'https://developer.nps.gov') do |f|
      f.params['api_key'] = ENV['NPS_API_KEY']
    end
  end
end