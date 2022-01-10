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
      expect(Score.high_score(@user_id)).to eq(@score_1)
    end

    it 'can find top score by city' do
      expect(Score.top_scores_by_location("city", "Denver")).to eq([@score_1, @score_3, @score_2])
    end
  end
end
