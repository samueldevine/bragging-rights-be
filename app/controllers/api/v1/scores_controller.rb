class Api::V1::ScoresController < ApplicationController
  def index
    get_user_location(params[:params][:geo_scope], params[:params][:ip_address])
    render json: ScoreSerializer.new(Score.top_5_highest_scores(params))
  end

  def create
    new_score = Score.create(score_params)
    if new_score.save
    else
      render json: { errors: { details: 'Superman says: "Cheaters Never Win"' } },
             status: 403
    end
  end

  private

  def score_params
    location = LocationsFacade.location_data(params[:score][:ip_address])
    params[:score][:city] = location.city
    params[:score][:state] = location.state
    params[:score][:country] = location.country
    params.require(:score).permit(:user_id, :score, :city, :state, :country)
  end

  def get_user_location(geo_scope, ip_address)
    user_location = LocationsFacade.location_data(ip_address)
    if geo_scope == 'city'
      params[:user_location] = user_location.city
    elsif geo_scope == 'state'
      params[:user_location] = user_location.state
    elsif geo_scope == 'country'
      params[:user_location] = user_location.country
    end
  end
end
