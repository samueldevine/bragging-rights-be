require 'rails_helper'

RSpec.describe 'Questions Index' do

  it 'send questions as json', :vcr do
    get '/api/v1/questions'

    expect(response).to be_successful

    questions = JSON.parse(response.body, symbolize_names: true)

  end
end
