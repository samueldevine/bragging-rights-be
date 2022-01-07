class LocationsFacade
  def self.location_data(ip_address)
    Location.new(LocationsService.location_data(ip_address))
  end
end
