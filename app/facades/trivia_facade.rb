class TriviaFacade
  class << self
    def trivia
      TriviaService.trivia.map do |t|
        TriviaQuestion.new(t)
      end 
    end
  end
end
