class User < ApplicationRecord
  has_many :favorites

  validates_presence_of :name
end