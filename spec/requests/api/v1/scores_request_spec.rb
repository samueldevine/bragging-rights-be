require 'rails_helper'

RSpec.describe 'Scores Index' do
  before :each do
    @score_1 = Score.create(score: 100,
                            game_time: 1.5,
                            user_id: 1,
                            city: 'Denver',
                            state: 'CO',
                            country: 'USA')
    @score_2 = Score.create(score: 10,
                            game_time: 1.3,
                            user_id: 1,
                            city: 'Denver',
                            state: 'CO',
                            country: 'USA')
    @score_3 = Score.create(score: 50,
                            game_time: 1.0,
                            user_id: 2,
                            city: 'Denver',
                            state: 'CO',
                            country: 'USA')
    @score_4 = Score.create(score: 100,
                            game_time: 2.2,
                            user_id: 3,
                            city: 'Chicago',
                            state: 'IL',
                            country: 'USA')

    @score_5 = Score.create(score: 100,
                            game_time: 0.04,
                            user_id: 3,
                            city: 'Athens',
                            state: 'nil',
                            country: 'Greece')
    @score_6 = Score.create(score: 100,
                            game_time: 1.6,
                            user_id: 4,
                            city: 'Athens',
                            state: 'nil',
                            country: 'Greece')
    @score_7 = Score.create(score: 5,
                            game_time: 100,
                            user_id: 5,
                            city: 'Detroit',
                            state: 'MI',
                            country: 'USA')
    @score_8 = Score.create(score: 150,
                            game_time: 60.3,
                            user_id: 7,
                            city: 'Chicago',
                            state: 'IL',
                            country: 'USA')
    @score_9 = Score.create(score: 250,
                            game_time: 1.5,
                            user_id: 5,
                            city: 'Tampa',
                            state: 'FL',
                            country: 'USA')
    @score_10 = Score.create(score: 8000,
                             game_time: 4.20,
                             user_id: 69,
                             city: 'Las Vegas',
                             state: 'NV',
                             country: 'USA')
  end

  it 'can dynamically render top scores by location', :vcr do
    get '/api/v1/scores', params: {ip_address: '73.217.89.89', geo_scope: "city"}

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

    get '/api/v1/scores', params: {ip_address: '73.217.89.89', geo_scope: "country"}
    scores = JSON.parse(response.body, symbolize_names: true)

    expect(scores[:data].count).to eq(5)
    require "pry"; binding.pry
    scores[:data].each do |score|
      expect(score[:attributes]).to have_key :user_id
      expect(score[:attributes][:user_id]).to be_an Integer
      expect(score[:attributes]).to have_key :score
      expect(score[:attributes][:score]).to be_an Integer
      expect(score[:attributes]).to have_key :game_time
      expect(score[:attributes][:game_time]).to be_a Float
    end
  end

  it 'can send the highest score by user id' do
    high_score = Score.create!(user_id: 15, score: 100, city: 'Chicago',
                               state: 'Illinois', country: 'United States')

    get '/api/v1/scores', params: { user_id: high_score.user_id }

    expect(response).to be_successful

    score = JSON.parse(response.body, symbolize_names: true)

    expect(score[:data]).to be_a(Array)
    score[:data].each do |s|
      expect(s).to have_key(:id)
      expect(s).to have_key(:type)
      expect(s).to have_key(:attributes)
      expect(s[:attributes]).to have_key(:score)
      expect(s[:attributes][:score]).to eq(high_score.score)
      expect(s[:attributes]).to have_key(:user_id)
      expect(s[:attributes]).to have_key(:city)
      expect(s[:attributes]).to have_key(:state)
      expect(s[:attributes]).to have_key(:country)
    end
  end

  it 'can create a new score', :vcr do
    game_params = { user_id: 7, score: 1000, ip_address: '98.160.143.100' }
    headers = { 'CONTENT_TYPE' => 'application/json' }

    post '/api/v1/scores', headers: headers,
                           params: JSON.generate(score: game_params)

    created_score = Score.last

    expect(response).to be_successful
    expect(created_score.user_id).to eq(game_params[:user_id])
    expect(created_score.score).to eq(game_params[:score])
    expect(created_score.city).to eq('Las Vegas')
  end
end
