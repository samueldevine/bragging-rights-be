class Score < ApplicationRecord

  # def self.high_score(user)
  #   where(user_id: user).order(score: :desc).first
  # end
  #
  # def self.top_scores_by_location(geo_scope, user_location)
  #   where("#{geo_scope} = '#{user_location}'").order(score: :desc).limit(5)
  # end

  def self.top_5_highest_scores(params)
    if params.has_key?(:geo_scope)
      where("#{params[:geo_scope]} = '#{params[:user_location]}'").order(score: :desc).limit(5)
    elsif params.has_key?(:user_id)
      where(user_id: params[:user_id]).order(score: :desc).limit(5)
    else
      order(score: :desc).limit(5)
    end
  end
end
