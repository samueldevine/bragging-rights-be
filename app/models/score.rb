class Score < ApplicationRecord

  def self.high_score(user)
    where(user_id: user).order(score: :desc).first
  end
  
  def self.top_scores_by_location(geo_scope, user_location)
    Score.where("#{geo_scope} = '#{user_location}'").order(score: :desc).limit(5)
  end
end
