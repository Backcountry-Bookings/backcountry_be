class Campsite < ApplicationRecord 
  reverse_geocoded_by :latitude, :longitude
end