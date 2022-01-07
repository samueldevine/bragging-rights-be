class LocationsService
  class << self
    def conn
      Faraday.new('http://ip-api.com/json/')
    end

    def parsed_location_data(url)
      response = conn.get(url)
      JSON.parse(response.body, symbolize_names: true)
    end
  end
end
