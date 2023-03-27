class CampsiteSearch
  attr_reader :name, :id, :description, :images

  def initialize(data)
    @name = data[:name]
    @id = data[:id]
    @description = data[:description]
    @images = data[:images]
  end
end