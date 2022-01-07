require 'rails_helper'

RSpec.describe "Trivia Question" do
  it 'exists' do
    question = TriviaQuestion.new(category: "Entertainment: Comics",
                                  type: "multiple",
                                  question: "In Marvel Comics, Taurus is the founder and leader of which criminal organization?",
                                  correct_answer: "Zodiac",
                                  incorrect_answers: ["Scorpio", "Tiger Mafia", "The Union"]
                              )

    expect(question).to be_an_instance_of(TriviaQuestion)
  end

  it 'has readable attributes' do
    question = TriviaQuestion.new(category: "Entertainment: Comics",
                                  type: "multiple",
                                  question: "In Marvel Comics, Taurus is the founder and leader of which criminal organization?",
                                  correct_answer: "Zodiac",
                                  incorrect_answers: ["Scorpio", "Tiger Mafia", "The Union"]
                              )

    expect(question.category).to eq("Entertainment: Comics")
    expect(question.type).to eq("multiple")
    expect(question.question).to eq("In Marvel Comics, Taurus is the founder and leader of which criminal organization?")
    expect(question.correct_answer).to eq("Zodiac")
    expect(question.incorrect_answers).to eq(["Scorpio", "Tiger Mafia", "The Union"])
    #test for @answers being randomized
  end
end
