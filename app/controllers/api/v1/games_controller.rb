class Api::V1::GamesController < ApplicationController
  def index
    render json: GameSerializer.new(Game.top_scores_by_location(params[:geo_scope], params[:user_location]))
  end

  def show
    #user
  end
end
