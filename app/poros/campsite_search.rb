class CampsiteSearch
  include ParkNameConverter

  attr_reader :name, :id, :description, :images, :park_code, :state, :cost

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @description = data[:description]
    @images = data[:images]
    @park_code = data[:parkCode]
    @state = data[:addresses]
    @cost = data[:fees]
  end

  def state_code 
    if state[0].nil?
      nil
    else
      state[0][:stateCode]
    end
  end

  def park_name
    convert_to_park_name(park_code.upcase)
  end
end