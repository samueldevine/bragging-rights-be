class TriviaFacade
  def self.trivia
    TriviaService.trivia[:results].map do |t|
      TriviaQuestion.new(t)
    end
  end
end
