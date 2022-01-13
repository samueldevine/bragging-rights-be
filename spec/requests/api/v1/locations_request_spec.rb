require 'rails_helper'

RSpec.describe 'index', type: :request do
  it 'can return all locational data for user', :vcr do
    get '/api/v1/locations', params: { ip_address: '98.160.143.100' }

    headers = { 'ACCEPT' => 'application/json' }
    expect(response.content_type).to eq('application/json')

    expect(response.status).to eq(200)
    expect(response).to be_successful

    location_data = JSON.parse(response.body, symbolize_names: true)

    expect(location_data[:data]).to have_key(:id)
    expect(location_data[:data]).to have_key(:type)
    expect(location_data[:data]).to have_key(:attributes)
    expect(location_data[:data][:attributes]).to have_key(:city)
    expect(location_data[:data][:attributes]).to have_key(:state)
    expect(location_data[:data][:attributes]).to have_key(:country)
  end
end
