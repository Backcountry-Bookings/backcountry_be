class CampsiteLocationSerializer
  include ParkNameConverter

  def self.location_serializer(location_data)
    {
      "data": location_data.map do |location|
        { 
          "id": location.nps_id,
          "type": "campsite_search",
          "attributes": {
                          "name": location.name,
                          "description": location.description,
                          "images": [
                            {
                              "credit": location.images0credit,
                              "crops": [],
                              "title": location.images0title,
                              "altText": location.images0altText,
                              "caption": location.images0caption,
                              "url": location.images0url
                            }
                          ],
                          "park_name": location.parkCode,
                          "state_code": location.addresses0stateCode,
                          "cost": [
                            {
                              "cost": location.fees0cost,
                              "description": location.fees0description,
                              "title": location.fees0title
                            }
                          ]
          }
        }  
      end
    }
  end
end
