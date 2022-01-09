class Game < ApplicationRecord
  def self.high_score(user)
    where(user_id: user).order(score: :desc).first
  end
end
