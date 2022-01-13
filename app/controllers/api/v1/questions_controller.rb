class Api::V1::QuestionsController < ApplicationController

  def index
    questions = QuestionsFacade.trivia
    require "pry"; binding.pry
    render json: QuestionSerializer.new(QuestionsFacade.trivia)
  end
end
