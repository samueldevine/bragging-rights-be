class GameSerializer
  include JSONAPI::Serializer

  attributes :city, :state, :country, :score, :user_id, :game_time
end
