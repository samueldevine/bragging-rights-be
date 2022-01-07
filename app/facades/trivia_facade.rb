class TriviaFacade
  class << self
    def trivia
      TriviaService.trivia[:results].map do |t|
        TriviaQuestion.new(t)
      end
    end
  end
end
