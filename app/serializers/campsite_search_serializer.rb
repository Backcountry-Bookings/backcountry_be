class CampsiteSearchSerializer
  include JSONAPI::Serializer

  attributes :name, :description, :images, :park_name, :state_code, :cost
end