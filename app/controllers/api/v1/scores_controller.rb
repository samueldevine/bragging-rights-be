class Api::V1::ScoresController < ApplicationController
  def index
    render json: ScoreSerializer.new(Score.top_scores_by_location(params[:geo_scope], params[:user_location]))
  end

  def show

    render json: ScoreSerializer.new(Score.high_score(params[:user_id]))
  end
end 
