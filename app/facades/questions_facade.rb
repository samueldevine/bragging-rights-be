class QuestionsFacade
  def self.trivia
    id = 0
    questions = QuestionsService.trivia[:results].map do |t|
      id += 1
      t[:id] = "#{id}"
      Question.new(t)
    end.shuffle![0..4]
  end
end
