class Api::V1::ScoresController < ApplicationController
  def index
    # render json: ScoreSerializer.new(Score.top_scores_by_location(params[:geo_scope], params[:user_location]))
    render json: ScoreSerializer.new(Score.top_5_highest_scores(params))
  end

  # def show
  #   render json: ScoreSerializer.new(Score.high_score(params[:user_id]))
  # end

  def create
    Score.create(score_params)
  end

  private

  def score_params
    location = LocationsFacade.location_data(params[:score][:ip_address])
    params[:score][:city] = location.city
    params[:score][:state] = location.state
    params[:score][:country] = location.country
    params.require(:score).permit(:user_id, :score, :city, :state, :country)
  end
end
