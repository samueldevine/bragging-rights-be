class AddstateToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :state, :string
  end
end
