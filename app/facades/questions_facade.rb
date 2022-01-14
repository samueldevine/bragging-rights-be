class QuestionsFacade
  def self.trivia
    id = 0
    QuestionsService.trivia[:results].map do |t|
      id += 1
      t[:id] = id.to_s
      Question.new(t)
    end.shuffle![0..4]
  end
end
