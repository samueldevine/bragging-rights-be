class Location
  attr_reader :id,
              :city,
              :state,
              :country

  def initialize(location_data)
    @city    = location_data[:city]
    @state   = location_data[:regionName]
    @country = location_data[:country]
  end
end
