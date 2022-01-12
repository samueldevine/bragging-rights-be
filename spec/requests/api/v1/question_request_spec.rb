require 'rails_helper'

RSpec.describe 'Questions Index' do

  it 'send questions as json', :vcr do
    get '/api/v1/questions'

    expect(response).to be_successful

    questions = JSON.parse(response.body, symbolize_names: true)
    
    expect(questions[:data].count).to eq(5)
    questions[:data].each do |question|
      expect(question[:attributes]).to have_key(:id)
      expect(question[:attributes][:id]).to be_a(String)
      expect(question[:attributes]).to have_key(:question)
      expect(question[:attributes][:question]).to be_a(String)
      expect(question[:attributes]).to have_key(:correct_answer)
      expect(question[:attributes][:correct_answer]).to be_a(String)
      expect(question[:attributes]).to have_key(:answers)
      expect(question[:attributes][:answers]).to be_a(Array)
    end
  end
end
