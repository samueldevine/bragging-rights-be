require 'rails_helper'

RSpec.describe GamesFacade do
  describe 'game' do
    it 'returns a game question', :vcr do
      question = GamesFacade.trivia

      expect(question.first).to be_a GamesQuestion
      expect(question.first.incorrect_answers.count).to eq(3)
      expect(question.first.answers.count).to eq(4)
    end
  end
end
