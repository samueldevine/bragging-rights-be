class Question
  attr_reader :category,
              :type,
              # :difficulty,
              :question,
              :correct_answer,
              :incorrect_answers,
              :answers,
              :id

  def initialize(info)
    @id                 = info[:id]
    @category           = info[:category]
    @type               = info[:type]
    #left out for proof of concept but need for stretch scoring goals
    # @difficulty         = info[:difficulty]
    @question           = CGI.unescapeHTML(info[:question])
    @correct_answer     = info[:correct_answer]
    @incorrect_answers  = info[:incorrect_answers]
    @answers            = randomized_answers
  end

  def randomized_answers
    sample = []
    sample << @incorrect_answers && sample << @correct_answer
    sample.flatten!.shuffle!
    sample = html_cleanup(sample)
  end

  def html_cleanup(sample)
    sample.map do |answer|
      CGI.unescapeHTML(answer)
    end
  end
end
