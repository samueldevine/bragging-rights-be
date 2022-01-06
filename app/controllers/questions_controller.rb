class QuestionsController < ApplicationController
  def show
    conn = Faraday.new('https://opentdb.com/api.php').get do |faraday|
      faraday.params['amount'] = 5
      faraday.params['category'] = 29
      faraday.params['difficulty'] = 'easy'
      faraday.params['type'] = 'multiple'
    end
      # ?amount=5&category=29&difficulty=easy&type=multiple


  end
end
