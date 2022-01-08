require 'rails_helper'

RSpec.describe TriviaFacade do
  describe 'trivia' do
    it 'returns a trivia question', :vcr do
      question = TriviaFacade.trivia

      expect(question.first).to be_a TriviaQuestion
      expect(question.first.incorrect_answers.count).to eq(3)
      expect(question.first.answers.count).to eq(4)
    end
  end
end
