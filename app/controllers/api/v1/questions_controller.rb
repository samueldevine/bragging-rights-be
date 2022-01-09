class Api::V1::QuestionsController < ApplicationController

  def index
    render json: QuestionSerializer.new(QuestionsFacade.trivia)
  end
end
