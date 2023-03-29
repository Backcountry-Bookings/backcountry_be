class CampsiteSearchSerializer
  include JSONAPI::Serializer

  attributes :name, :description, :images, :park_code
end