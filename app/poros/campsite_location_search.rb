class CampsiteLocationSearch 
  include ParkNameConverter

  attr_reader :name, :id, :description, :images, :park_code, :state_code, :cost

  def initialize(data)
    @name = data[:name]
    @id = data[:geometryPoiId]
    @description = data[:description]
    @images = data[:images0url]
    @park_code = data[:parkCode]
    @state_code = data[:addresses0stateCode]
    @cost = data[:fees0cost]
  end

  # def state_code 
  #   if state[0].nil?
  #     nil
  #   else
  #     state[0][:stateCode]
  #   end
  # end

  def park_name
    convert_to_park_name(park_code.upcase)
  end
end