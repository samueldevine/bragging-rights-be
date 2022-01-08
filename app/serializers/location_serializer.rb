class LocationSerializer
  include JSONAPI::Serializer

  attributes :city, :state, :country
end
