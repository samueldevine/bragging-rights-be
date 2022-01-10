class ScoreSerializer
  include JSONAPI::Serializer
  
  attributes :score, :user_id, :game_time, :city, :state, :country
end
