class AddgameTimeToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :game_time, :time
  end
end
