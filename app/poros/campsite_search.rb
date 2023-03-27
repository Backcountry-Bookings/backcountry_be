class CampsiteSearch
  attr_reader :name, :id, :description, :images, :park_code

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @description = data[:description]
    @images = data[:images]
    @park_code = data[:parkCode]
  end
end