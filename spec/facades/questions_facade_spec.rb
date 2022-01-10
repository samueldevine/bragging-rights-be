require 'rails_helper'

RSpec.describe QuestionsFacade do
  describe 'game' do
    it 'returns a game question', :vcr do
      question = QuestionsFacade.trivia

      expect(question.first).to be_a Question
      expect(question.first.incorrect_answers.count).to eq(3)
      expect(question.first.answers.count).to eq(4)
    end
  end
end
