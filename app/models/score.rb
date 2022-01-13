class Score < ApplicationRecord
  validates_presence_of :score
  validates_presence_of :user_id

  def self.top_5_highest_scores(params = {})
    if params.has_key?(:geo_scope) && params[:geo_scope] != 'world'
      where("#{params[:geo_scope]} = '#{params[:user_location]}'").order(score: :desc).limit(5)
    elsif params.has_key?(:user_id)
      where(user_id: params[:user_id]).order(score: :desc).limit(5)
    else
      order(score: :desc).limit(5)
    end
  end
end
