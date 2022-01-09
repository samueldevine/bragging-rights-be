class Game < ApplicationRecord
  def self.top_scores_by_location(geo_scope, user_location)
    Game.where("#{geo_scope} = '#{user_location}'").order(score: :desc).limit(5)
  end
end
