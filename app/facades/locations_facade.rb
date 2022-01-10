class LocationsFacade
  def self.location_data(ip_address)
    # require 'pry'; binding.pry
    Location.new(LocationsService.parsed_location_data(ip_address))
  end
end
