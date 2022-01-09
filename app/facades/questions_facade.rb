class QuestionsFacade
  def self.trivia
    id = 0
    QuestionsService.trivia[:results].map do |t|
      id += 1
      t[:id] = "#{id}"
      Question.new(t)
    end
  end
end
