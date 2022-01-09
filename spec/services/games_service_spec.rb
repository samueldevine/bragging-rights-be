require 'rails_helper'

RSpec.describe GamesService do
  describe 'conn' do
    it 'has a connection to opentdb' do
      conn = GamesService.conn

      expect(conn).to be_a Faraday::Connection
    end
  end
end
