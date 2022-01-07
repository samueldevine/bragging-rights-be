class TriviaQuestion
  attr_reader :category,
              :type,
              # :difficulty,
              :question,
              :correct_answer,
              :incorrect_answers,
              :answers

  def initialize(info)
    @category           = info[:category]
    @type               = info[:type]
    # @difficulty         = info[:difficulty]
    @question           = info[:question]
    @correct_answer     = info[:correct_answer]
    @incorrect_answers  = info[:incorrect_answers]
    @answers            = randomized_answers
  end

  def randomized_answers
    sample = []
    sample << @incorrect_answers && @correct_answer
    sample.flatten.shuffle!
  end
end
