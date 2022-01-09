class GamesFacade
  def self.trivia
    GamesService.trivia[:results].map do |t|
      GamesQuestion.new(t)
    end
  end
end
