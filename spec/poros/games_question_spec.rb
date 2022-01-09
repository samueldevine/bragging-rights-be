require 'rails_helper'

RSpec.describe "Games Question" do
  it 'exists' do
    question = GamesQuestion.new(category: "Entertainment: Comics",
                                  type: "multiple",
                                  question: "In Marvel Comics, Taurus is the founder and leader of which criminal organization?",
                                  correct_answer: "Zodiac",
                                  incorrect_answers: ["Scorpio", "Tiger Mafia", "The Union"]
                              )

    expect(question).to be_an_instance_of(GamesQuestion)
  end

  it 'has readable attributes' do
    question = GamesQuestion.new(category: "Entertainment: Comics",
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
    expect(question.answers.count).to eq(4)
  end
end
