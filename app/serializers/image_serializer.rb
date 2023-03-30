class ImageSerializer
  include JSONAPI::Serializer

  attributes :id, :pic_url
  belongs_to :review
end