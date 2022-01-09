require 'rails_helper'

 RSpec.describe 'Games API' do
   it "can send the game with the highest score" do
     game = Game.create!(user_id: 7, score: 100, city: 'Chicago', state: 'Illinois', country: 'United States')

     get "/api/v1/games/#{game.id}", params: {user_id: 7}

     expect(response).to be_successful

     game = JSON.parse(response.body, symbolize_names: true)

     expect(game[:data]).to be_a(Hash)
     expect(game[:data]).to have_key(:id)
     expect(game[:data]).to have_key(:type)
     expect(game[:data]).to have_key(:attributes)
     expect(game[:data][:attributes]).to have_key(:score)
     expect(game[:data][:attributes]).to have_key(:game_time)
     expect(game[:data][:attributes]).to have_key(:user_id)
     expect(game[:data][:attributes]).to have_key(:city)
     expect(game[:data][:attributes]).to have_key(:state)
     expect(game[:data][:attributes]).to have_key(:country)
   end
 end
