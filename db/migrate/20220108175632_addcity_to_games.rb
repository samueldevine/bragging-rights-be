class AddcityToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :city, :string
  end
end
