require 'rails_helper'

RSpec.describe Location do
  before :each do
    @location = Location.new(
      city: 'Denver',
      regionName: 'Colorado',
      country: 'United States'
    )
  end

  describe 'initialize' do
    it 'exists' do
      expect(@location).to be_a Location
    end

    it 'has readable attributes' do
      expect(@location.city).to eq 'Denver'
      expect(@location.state).to eq 'Colorado'
      expect(@location.country).to eq 'United States'
    end
  end
end
