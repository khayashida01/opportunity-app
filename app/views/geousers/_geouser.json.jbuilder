json.extract! geouser, :id, :title, :description, :address, :latitude, :longitude, :created_at, :updated_at
json.url geouser_url(geouser, format: :json)
