class Image < ApplicationRecord
  belongs_to :review
  has_one_attached :img_file

  def pic_url
    self.img_file.attachment.url
  end
end