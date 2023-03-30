class Review < ApplicationRecord
  validates_presence_of :campsite_id
  belongs_to :user
end