class FavoriteSerializer
  include JSONAPI::Serializer

  attributes :campsite_name, :campsite_id, :campsite_details, :image
end