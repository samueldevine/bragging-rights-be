require 'rails_helper'

RSpec.describe Game do
  before :each do
    @user_id = 1
    @game = Game.create(score: 100,
                  game_time: Time.now,
                  user_id: @user_id,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @game2 = Game.create(score: 10,
                  game_time: Time.now,
                  user_id: @user_id,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @game3 = Game.create(score: 50,
                  game_time: Time.now,
                  user_id: 2,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )

    @game4 = Game.create(score: 100,
                  game_time: Time.now,
                  user_id: 3,
                  city: "Chicago",
                  state: "IL",
                  country: "USA"
                )
  end

  describe 'methods' do
    it 'can find top score by user' do
      expect(Game.high_score(@user_id)).to eq(@game)
    end

    it 'can find top score by city' do
      expect(Game.top_scores_by_location("city", "Denver")).to eq([@game, @game3, @game2])
    end
  end
end
