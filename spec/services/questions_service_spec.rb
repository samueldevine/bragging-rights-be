require 'rails_helper'

RSpec.describe QuestionsService do
  describe 'conn' do
    it 'has a connection to opentdb' do
      conn = QuestionsService.conn

      expect(conn).to be_a Faraday::Connection
    end
  end
end
