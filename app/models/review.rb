class Review < ApplicationRecord
  validates_presence_of :campsite_id
  belongs_to :user
  has_one_attached :img_file

  def image_url
    if img_file.attached?
      self.img_file.service_url
    else
      "No Image"
    end
  end
end