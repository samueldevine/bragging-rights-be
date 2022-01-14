class Api::V1::QuestionsController < ApplicationController
  def index
    questions = QuestionsFacade.trivia
    render json: QuestionSerializer.new(QuestionsFacade.trivia)
  end
end
