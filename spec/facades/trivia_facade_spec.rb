require 'rails_helper'

RSpec.describe TriviaFacade do
  describe 'trivia' do
    it 'returns a trivia question', :vcr do
      question = TriviaFacade.trivia

      expect(question.first).to be_a TriviaQuestion
    end
  end
end
