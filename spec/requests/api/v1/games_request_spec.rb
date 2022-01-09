require 'rails_helper'

RSpec.describe "Games Index" do
  before :each do
    @game = Game.create(score: 100,
                  game_time: 1.5,
                  user_id: 1,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @game2 = Game.create(score: 10,
                  game_time: 1.3,
                  user_id: 1,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @game3 = Game.create(score: 50,
                  game_time: 1.0,
                  user_id: 2,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @game4 = Game.create(score: 100,
                  game_time: 2.2,
                  user_id: 3,
                  city: "Chicago",
                  state: "IL",
                  country: "USA"
                )

    @game5 = Game.create(score: 100,
                  game_time: 0.04,
                  user_id: 3,
                  city: "Athens",
                  state: "nil",
                  country: "Greece"
                )
    @game6 = Game.create(score: 100,
                  game_time: 1.6,
                  user_id: 4,
                  city: "Athens",
                  state: "nil",
                  country: "Greece"
                )
    @game7 = Game.create(score: 5,
                  game_time: 100,
                  user_id: 5,
                  city: "Detroit",
                  state: "MI",
                  country: "USA"
                )
    @game8 = Game.create(score: 150,
                  game_time: 60.3,
                  user_id: 7,
                  city: "Chicago",
                  state: "IL",
                  country: "USA"
                )
    @game9 = Game.create(score: 250,
                  game_time: 1.5,
                  user_id: 5,
                  city: "Tampa",
                  state: "FL",
                  country: "USA"
                )
    @game10 = Game.create(score: 8000,
                  game_time: 4.20,
                  user_id: 69,
                  city: "Las Vegas",
                  state: "NV",
                  country: "USA"
                )

  end

  it 'can dynamically render top scores by location' do
    get '/api/v1/games', params: {user_location: "Denver", geo_scope: "city"}
    expect(response).to be_successful
    scores = JSON.parse(response.body, symbolize_names: true)
    expect(scores[:data].count).to eq(3)

    scores[:data].each do |score|
      expect(score[:attributes]).to have_key :user_id
      expect(score[:attributes][:user_id]).to be_an Integer
      expect(score[:attributes]).to have_key :score
      expect(score[:attributes][:score]).to be_an Integer
      expect(score[:attributes]).to have_key :game_time
      expect(score[:attributes][:game_time]).to be_a Float
    end

    get '/api/v1/games', params: {user_location: "USA", geo_scope: "country"}
    scores = JSON.parse(response.body, symbolize_names: true)
    
    expect(scores[:data].count).to eq(5)

    scores[:data].each do |score|
      expect(score[:attributes]).to have_key :user_id
      expect(score[:attributes][:user_id]).to be_an Integer
      expect(score[:attributes]).to have_key :score
      expect(score[:attributes][:score]).to be_an Integer
      expect(score[:attributes]).to have_key :game_time
      expect(score[:attributes][:game_time]).to be_a Float
    end
  end
end
