class Review < ApplicationRecord
  # validates_presence_of :campsite_id
  belongs_to :user
  has_one_attached :img_file
end