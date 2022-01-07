require 'rails_helper'

RSpec.describe LocationsService do
  it 'creates a faraday connection' do
    expect(LocationsService.conn).to be_a Faraday::Connection
  end

  it 'parses JSON data into a hash with location information', :vcr do
    ip_address = '38.34.99.130'
    location_data = LocationsService.parsed_location_data(ip_address)

    expect(location_data).to be_a Hash
    expect(location_data).to have_key :city
    expect(location_data).to have_key :regionName
    expect(location_data).to have_key :country
  end
end
