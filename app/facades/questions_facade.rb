class QuestionsFacade
  def self.trivia
    QuestionsService.trivia[:results].map do |t|
      Question.new(t)
    end
  end
end
