require 'rails_helper'

RSpec.describe LocationsFacade do
  it 'creates a location object', :vcr do
    ip_address = '38.34.99.130'
    location = LocationsFacade.location_data(ip_address)

    expect(location).to be_a Location
    expect(location.city).to eq 'Denver'
    expect(location.state).to eq 'Colorado'
    expect(location.country).to eq 'United States'
  end
end
