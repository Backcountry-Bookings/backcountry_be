class CampsiteService

  def self.find_by_camp(camp_id)
    parse(conn.get("/api/v1/campgrounds?q=#{camp_id}&limit=1"))
  end

  def self.find_by_state(state_code)
    parse(conn.get("/api/v1/campgrounds?stateCode=#{state_code}"))
  end

  def self.find_by_name(name)
    parse(conn.get("/api/v1/campgrounds?q=#{name}"))
  end

  def self.find_by_park(park)
    parse(conn.get("/api/v1/campgrounds?parkCode=#{park}"))
  end

  def self.find_by_location(lat, long)
    parse(conn.get("/api/v1/campgrounds?lat=#{lat}&long=#{long}"))
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