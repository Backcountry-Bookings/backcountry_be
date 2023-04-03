class Review < ApplicationRecord
  validates_presence_of :campsite_id
  belongs_to :user
  has_one_attached :img_file
  validates :img_file, size: { between: 1.kilobyte..5.megabytes , message: 'is not given between size' }, content_type: ['image/png', 'image/jpg', 'image/jpeg']

  def image_url
    if img_file.attached?
      self.img_file.service_url
    else
      "No Image"
    end
  end
end