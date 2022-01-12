require 'rails_helper'

RSpec.describe Score do
  before :each do
    @user_id = 1
    @score_1 = Score.create(score: 100,
                  game_time: Time.now,
                  user_id: @user_id,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @score_2 = Score.create(score: 10,
                  game_time: Time.now,
                  user_id: @user_id,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )
    @score_3 = Score.create(score: 50,
                  game_time: Time.now,
                  user_id: 2,
                  city: "Denver",
                  state: "CO",
                  country: "USA"
                )

    @score_4 = Score.create(score: 100,
                  game_time: Time.now,
                  user_id: 3,
                  city: "Chicago",
                  state: "IL",
                  country: "USA"
                )
  end

  describe 'methods' do
    it 'can find top score by user' do
      scores_by_player_id = Score.top_5_highest_scores({user_id: @user_id})

      expect(scores_by_player_id).to eq([@score_1, @score_2])
    end

    it 'can find top score by city' do
      scores_by_city = Score.top_5_highest_scores({geo_scope: "city", user_location: 'Denver'})
      expected = scores_by_city.map do |score|
        score
      end
      expect(expected).to eq([@score_1, @score_3, @score_2])
    end
  end
end
