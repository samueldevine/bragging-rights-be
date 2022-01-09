require 'rails_helper'

 RSpec.describe Game do
   describe 'class methods' do
     describe '.high_score' do
       it "can find user's highest score" do
         user = 1
         game1 = Game.create!(user_id: 1, score: 100, city: 'Chicago', state: 'Illinois', country: 'United States')
         game2 = Game.create!(user_id: 1, score: 200, city: 'Chicago', state: 'Illinois', country: 'United States')
         game3 = Game.create!(user_id: 1, score: 50, city: 'Chicago', state: 'Illinois', country: 'United States')

         expect(Game.high_score(user)).to eq(game2)
       end
     end
   end
 end
