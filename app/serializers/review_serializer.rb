class ReviewSerializer
  include JSONAPI::Serializer

  attributes :image_url, :description, :rating, :site_name, :campsite_id, :name, :created_at
end