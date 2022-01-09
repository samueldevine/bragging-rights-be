class Api::V1::GamesController < ApplicationController
  def index
    #locations
  end

  def show
    render json: GameSerializer.new(Game.high_score(params[:user_id]))
  end
end
