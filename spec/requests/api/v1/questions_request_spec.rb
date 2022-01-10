require 'rails_helper'

RSpec.describe 'Questions Index' do

  it 'send questions as json', :vcr do
    get '/api/v1/questions'

    expect(response).to be_successful

    questions = JSON.parse(response.body, symbolize_names: true)

    # require "pry"; binding.pry
    expect(questions[:data].count).to eq(50)
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

  it 'can create a new game' do
    game_params = {user_id: 7, score: 1000, city: "Las Vegas", state: "NV", country: "USA", game_time: 5.30}
    headers = {"CONTENT_TYPE" => "application/json"}

    post '/api/v1/games', headers: headers, params: JSON.generate(game: game_params)

    created_game = Game.last

    expect(response).to be_successful
    expect(created_game.user_id).to eq(game_params[:user_id])
    expect(created_game.score).to eq(game_params[:score])
    expect(created_game.city).to eq(game_params[:city])
    expect(created_game.state).to eq(game_params[:state])
    expect(created_game.country).to eq(game_params[:country])
    expect(created_game.game_time).to eq(game_params[:game_time])
  end
end
