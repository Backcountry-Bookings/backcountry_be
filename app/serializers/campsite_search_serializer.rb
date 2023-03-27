class CampsiteSearchSerializer
  include JSONAPI::Serializer

  attributes :name, :description, :images
end