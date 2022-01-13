require 'rails_helper'

RSpec.describe Score do
  before :each do
    @user_id = 1
    @score_1 = Score.create(score: 101,
                            game_time: Time.now,
                            user_id: @user_id,
                            city: 'Denver',
                            state: 'CO',
                            country: 'USA')

    @score_2 = Score.create(score: 10,
                            game_time: Time.now,
                            user_id: @user_id,
                            city: 'Denver',
                            state: 'CO',
                            country: 'USA')

    @score_3 = Score.create(score: 50,
                            game_time: Time.now,
                            user_id: 2,
                            city: 'Denver',
                            state: 'CO',
                            country: 'USA')

    @score_4 = Score.create(score: 100,
                            game_time: Time.now,
                            user_id: 3,
                            city: 'Chicago',
                            state: 'IL',
                            country: 'USA')

    @score_5 = Score.create(score: 1,
                            game_time: Time.now,
                            user_id: 3,
                            city: 'Greenbow',
                            state: 'AL',
                            country: 'USA')

    @score_6 = Score.create(score: 12,
                            game_time: Time.now,
                            user_id: 3,
                            city: 'Greenbow',
                            state: 'AL',
                            country: 'USA')

    @score_7 = Score.create(score: 90,
                            game_time: Time.now,
                            user_id: 2,
                            city: 'South Park',
                            state: 'CO',
                            country: 'USA')
  end

  describe 'methods' do
    it 'can find top score by user' do
      scores_by_player_id = Score.top_5_highest_scores({ user_id: @user_id })

      expect(scores_by_player_id).to eq([@score_1, @score_2])
    end

    it 'can find top score by city' do
      scores_by_city = Score.top_5_highest_scores({ geo_scope: 'city',
                                                    user_location: 'Denver' })
      expected = scores_by_city.map do |score|
        score
      end
      expect(expected).to eq([@score_1, @score_3, @score_2])
    end

    it 'can find top score by state' do
      scores_by_state = Score.top_5_highest_scores({ geo_scope: 'state',
                                                     user_location: 'CO' })
      expected = scores_by_state.map do |score|
        score
      end
      expect(expected).to eq([@score_1, @score_7, @score_3, @score_2])
    end

    it 'returns top 5 scores if no params are passed' do
      scores_no_params = Score.top_5_highest_scores
      expected = scores_no_params.map do |score|
        score
      end
      expect(expected).to eq([@score_1, @score_4, @score_7, @score_3, @score_6])
      expect(expected.include?(@score_2)).to eq(false)
      expect(expected.include?(@score_5)).to eq(false)
    end
  end
end
