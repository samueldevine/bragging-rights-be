require 'rails_helper'

 RSpec.describe 'baseservice' do
   it "can get a connection" do
     expect(BaseService.conn('https://opentdb.com/api.php')).to be_a(Faraday::Connection)
   end
 end
