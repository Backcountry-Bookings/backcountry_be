class CampsiteSearch
  attr_reader :name, :id, :description, :images, :park_code, :cost

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @description = data[:description]
    @images = data[:images]
    @park_code = data[:parkCode]
    @cost = data[:fees]
  end
end