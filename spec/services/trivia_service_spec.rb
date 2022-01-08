require 'rails_helper'

RSpec.describe TriviaService do
  describe 'conn' do
    it 'has a connection to opentdb' do
      conn = TriviaService.conn

      expect(conn).to be_a Faraday::Connection
    end
  end
end